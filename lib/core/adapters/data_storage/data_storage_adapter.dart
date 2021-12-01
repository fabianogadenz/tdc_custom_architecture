abstract class DataStorageAdapter {
  save(String key, dynamic value);
  dynamic get(String key);
  dynamic remove(String key);
}
