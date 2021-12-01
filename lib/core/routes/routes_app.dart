import 'package:get/get_navigation/src/routes/get_route.dart';

class RoutesApp {
  static String getInitialRoute() => splashScreen;

  static const splashScreen = '/splash';
  static const loginScreen = '/login';
  static const homeScreen = '/home';

  static List<GetPage> routes = [
    // GetPage(
    //   name: loginScreen,
    //   binding: AuthenticationBindings(),
    //   page: () {
    //     return LoginScreen(
    //       authController: Get.find(),
    //       appController: Get.find(),
    //     );
    //   },
    // ),
  ];
}
