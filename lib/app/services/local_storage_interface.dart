abstract class ILocalStorage {
  Future<List<String>> getAll(String key);
  Future<bool> put(String key, List<String> value);
  Future<bool> delete(String key);
}
