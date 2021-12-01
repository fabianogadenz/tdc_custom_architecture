import 'package:custom_architecture/core/handlers/error_and_loading_state_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {
  final GetStorage box;

  final _isLoading = false.obs;
  final RxString _snackbarErrorValue = ''.obs;

  AppController({required this.box}) {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => ErrorAndLoadingStateHandler(
        isLoading: _isLoading,
        snackbarErrorValue: _snackbarErrorValue,
      ).call(),
    );
  }

  bool get isLogged {
    return box.hasData('authentication');
  }

  void logoff() => box.remove('authentication');
  // void setAuthentication(LoginModel loginData) {
  //   final a = val.toJson();
  //   box.write('authentication', loginData.toJson());
  //   setUser(val.user!);
  // }

  // void setUser(UserModel user) {
  //   box.write('user', user.toJson());
  // }

  // String get token {
  //   if (!box.hasData('authentication')) {
  //     return '';
  //   }
  //   LoginModel auth = LoginModel.fromJson(box.read('authentication'););
  //   return auth.accessToken!;
  // }

  // UserModel get getCurrentUser {
  //   UserModel user = UserModel.fromJson(box.read('user'););
  //   return user;
  // }

  setError(String value) {
    _snackbarErrorValue.value = value;
    _isLoading.value = false;
  }

  setIsLoading(bool isLoading) => _isLoading.value = isLoading;
}
