import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/bindings/initial_bindings.dart';
import 'core/routes/routes_app.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Remessa Architecture',
      debugShowCheckedModeBanner: false,
      getPages: RoutesApp.routes,
      initialRoute: RoutesApp.getInitialRoute(),
      initialBinding: InitialBinding(),
    );
  }
}
