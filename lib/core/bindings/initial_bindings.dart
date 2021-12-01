import 'package:custom_architecture/core/adapters/http_adapter.dart';
import 'package:custom_architecture/core/adapters/http_adapter_dio.dart';
import 'package:custom_architecture/core/controllers/app_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    final box = GetStorage();
    Get.put<AppController>(
      AppController(box: box),
      permanent: true,
    );
    Get.put<HttpAdapter>(HttpAdapterDio());
  }
}
