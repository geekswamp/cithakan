import 'package:fpdart/fpdart.dart';

import '../failure.dart';

/// A function that convert a response data to a specific type.
///
/// [T] is the type of the response data.
typedef ResponseConverter<T> = T Function(dynamic data);

/// Shortcut for [TaskEither<Failure, T>].
///
/// [T] is the type of the response data.
typedef ServerResponse<T> = TaskEither<Failure, T>;

/// Default duration for [Dio] client
const Duration kDuration = Duration(seconds: 30);

/// [DioClient] is an abstract class that defines the methods to send a request to the server.
abstract interface class DioClient {
  /// [get] is a method that returns a [ServerResponse] with a [T] object.
  ServerResponse<T> get<T>(
      String path,
      ResponseConverter<T> converter, {
        Map<String, dynamic>? params,
      });

  /// [post] is a method that returns a [ServerResponse] with a [T] object.
  ServerResponse<T> post<T>(
      String path,
      ResponseConverter<T> converter, {
        Map<String, dynamic>? params,
        dynamic data,
      });

  /// [put] is a method that returns a [ServerResponse] with a [T] object.
  ServerResponse<T> put<T>(
      String path,
      ResponseConverter<T> converter, {
        Map<String, dynamic>? params,
        dynamic data,
      });

  /// [delete] is a method that returns a [ServerResponse] with a [T] object.
  ServerResponse<T> delete<T>(
      String path,
      ResponseConverter<T> converter, {
        Map<String, dynamic>? params,
      });
}
