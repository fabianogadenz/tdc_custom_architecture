import 'package:custom_architecture/core/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/bindings/initial_bindings.dart';
import 'core/routes/routes_app.dart';

void main() async {
  await GetStorage.init();
  runApp(
    MyApp(
      getStorage: GetStorage(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GetStorage getStorage;

  const MyApp({Key? key, required this.getStorage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Remessa Architecture',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.dark,
      getPages: RoutesApp.routes,
      initialRoute: getStorage.read('token') != null
          ? RoutesApp.homeScreen
          : RoutesApp.loginScreen,
      initialBinding: InitialBinding(getStorage),
    );
  }
}
