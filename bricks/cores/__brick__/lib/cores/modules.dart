import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import 'env/env.dart';
import 'network/dio_client.dart';
import 'network/network_interceptor.dart';
import 'storage/secure_storage.dart';

/// A module that will be used to inject dependencies.
@module
abstract class Modules {
  /// [FlutterSecureStorage] instance.
  @lazySingleton
  FlutterSecureStorage get storage => const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      sharedPreferencesName: kStorageName,
    ),
    iOptions: IOSOptions(
      accountName: kStorageName,
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  /// [Dio] instance.
  @lazySingleton
  Dio dio(NetworkInterceptor networkInterceptor) {
    final dio = Dio(
      BaseOptions(
        baseUrl: !kReleaseMode ? Env.baseUrlDev : Env.baseUrl,
        connectTimeout: kDuration,
        receiveTimeout: kDuration,
        sendTimeout: kDuration,
        contentType: Headers.jsonContentType,
        followRedirects: false,
        validateStatus: (status) => status! < 500,
      ),
    );

    dio.interceptors.add(networkInterceptor);
    if (!kReleaseMode) {
      dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }

    return dio;
  }
}
