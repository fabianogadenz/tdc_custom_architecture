import 'package:custom_architecture/core/routes/routes_app.dart';
import 'package:custom_architecture/modules/authentication/application/presenters/authentication_presenter.dart';
import 'package:custom_architecture/modules/authentication/application/view_models/user_view_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<UserViewModel> {
  final AuthenticationPresenter authPresenter;

  HomeController(this.authPresenter);

  @override
  void onInit() {
    getAuthUser();
    super.onInit();
  }

  void logout() {
    authPresenter.logout();
    Get.offAndToNamed(RoutesApp.loginScreen);
  }

  void getAuthUser() async {
    await Future.delayed(const Duration(seconds: 1));

    final user = authPresenter.getUser();

    if (user != null) {
      change(user, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error('Parece que você não está logado!'));
    }
  }
}
