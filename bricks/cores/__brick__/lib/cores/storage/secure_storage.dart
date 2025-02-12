import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import 'storage_base.dart';

// TODO: Change your local storage name.
/// Storage name.
const String kStorageName = 'SECURE_LOCAL_STORAGE';

/// {@template secure_storage}
/// Securing all data that is stored in the application.
/// {@endtemplate}
@LazySingleton(as: BaseStorage)
final class SecureStorage extends BaseStorage {
  /// {@macro secure_storage}
  SecureStorage(this._storage);

  final FlutterSecureStorage _storage;

  @override
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  @override
  Future<void> write(String key, String value) async {
    return await _storage.write(key: key, value: value);
  }

  @override
  Future<void> delete(String key) async {
    return await _storage.delete(key: key);
  }

  @override
  Future<void> deleteAll() async {
    return await _storage.deleteAll();
  }
}
