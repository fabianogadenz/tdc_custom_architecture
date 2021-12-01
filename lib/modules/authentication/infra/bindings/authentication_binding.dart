import 'package:custom_architecture/modules/authentication/view/controllers/login_controller.dart';
import 'package:get/get.dart';

class AuthenticationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(
      appController: Get.find(),
      authPresenter: Get.find(),
    ));
  }
}
