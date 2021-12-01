import 'package:custom_architecture/modules/authentication/infra/bindings/authentication_binding.dart';
import 'package:custom_architecture/modules/authentication/view/screens/login_screen.dart';
import 'package:custom_architecture/modules/home/infra/bindings/home_binding.dart';
import 'package:custom_architecture/modules/home/view/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RoutesApp {
  static const loginScreen = '/login';
  static const homeScreen = '/home';

  static List<GetPage> routes = [
    GetPage(
      name: loginScreen,
      binding: AuthenticationBinding(),
      page: () {
        return LoginScreen(
          controller: Get.find(),
        );
      },
    ),
    GetPage(
      name: homeScreen,
      binding: HomeBinding(),
      page: () {
        return HomeScreen(homeController: Get.find());
      },
    ),
  ];
}
