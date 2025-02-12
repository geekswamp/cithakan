import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../failure.dart';
import '../isolate_parser.dart';
import 'dio_client.dart';

@LazySingleton(as: DioClient)
final class DioClientImpl implements DioClient {
  const DioClientImpl(this._dio);

  final Dio _dio;

  @override
  ServerResponse<T> delete<T>(
      String path,
      ResponseConverter<T> converter, {
        Map<String, dynamic>? params,
      }) {
    return TaskEither<Failure, T>.tryCatch(
          () async {
        final Response response = await _dio.delete(
          path,
          queryParameters: params,
        );
        return await _parseResponse(response, converter);
      },
      _handleError,
    );
  }

  @override
  ServerResponse<T> get<T>(
      String path,
      ResponseConverter<T> converter, {
        Map<String, dynamic>? params,
      }) {
    return TaskEither<Failure, T>.tryCatch(
          () async {
        final Response response = await _dio.get(
          path,
          queryParameters: params,
        );
        return await _parseResponse(response, converter);
      },
      _handleError,
    );
  }

  @override
  ServerResponse<T> post<T>(
      String path,
      ResponseConverter<T> converter, {
        Map<String, dynamic>? params,
        data,
      }) {
    return TaskEither<Failure, T>.tryCatch(
          () async {
        final Response response = await _dio.post(
          path,
          queryParameters: params,
          data: data,
        );
        return await _parseResponse(response, converter);
      },
      _handleError,
    );
  }

  @override
  ServerResponse<T> put<T>(
      String path,
      ResponseConverter<T> converter, {
        Map<String, dynamic>? params,
        data,
      }) {
    return TaskEither<Failure, T>.tryCatch(
          () async {
        final Response response = await _dio.put(
          path,
          queryParameters: params,
          data: data,
        );
        return await _parseResponse(response, converter);
      },
      _handleError,
    );
  }

  Failure _handleError(Object e, StackTrace stackTrace) {
    if (e is SocketException) {
      debugPrint('No internet connection');
      return ServerFailure('No internet connection');
    } else if (e is DioException) {
      if (e.response?.statusCode == HttpStatus.internalServerError) {
        debugPrint('Internal server error');
        return ServerFailure('Internal server error');
      } else if (e.type == DioExceptionType.connectionTimeout) {
        debugPrint('Connection time out');
        return ServerFailure('Connection time out');
      }

      final message =
      e.response?.data != null && e.response!.data is Map<String, dynamic>
          ? e.response!.data['message']
          : e.message;

      debugPrint('$message');
      return ServerFailure(message);
    } else {
      debugPrint('Unknown error: $e');
      return ServerFailure('Unknown error');
    }
  }

  Future<T> _parseResponse<T>(
      Response response,
      ResponseConverter<T> converter,
      ) async {
    final int statusCode = response.statusCode ?? 0;
    if (statusCode < HttpStatus.ok || statusCode > HttpStatus.created) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    } else {
      final IsolateParser<T> parser = IsolateParser<T>(
        response.data as Map<String, dynamic>,
        converter,
      );
      return await parser.parseInBackground();
    }
  }
}
