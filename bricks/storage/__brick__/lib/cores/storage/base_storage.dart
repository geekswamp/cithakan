/// {@template base_storage}
/// Storage base interface.
/// {@endtemplate}
abstract class BaseStorage {
  /// {@macro base_storage}
  const BaseStorage();

  /// Get a value from the storage.
  Future<String?> read(String key);

  /// Write a value to the storage.
  Future<void> write(String key, String value);

  /// Delete a value from the storage.
  Future<void> delete(String key);

  /// Delete all values from the storage.
  Future<void> deleteAll();
}
