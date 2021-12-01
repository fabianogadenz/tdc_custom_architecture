import 'package:custom_architecture/core/adapters/data_storage/data_storage_adapter.dart';
import 'package:get_storage/get_storage.dart';

class DataStorageAdapterGet implements DataStorageAdapter {
  final GetStorage box;

  DataStorageAdapterGet(this.box);

  @override
  get(String key) {
    return box.read(key);
  }

  @override
  save(String key, value) {
    box.write(key, value);
  }

  @override
  remove(String key) {
    box.remove(key);
  }
}
