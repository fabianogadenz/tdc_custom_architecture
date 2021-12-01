import 'package:custom_architecture/core/handlers/error_and_loading_state_handler.dart';
import 'package:custom_architecture/core/models/error_message_model.dart';
import 'package:custom_architecture/modules/authentication/application/presenters/authentication_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  final AuthenticationPresenter authPresenter;

  final _isLoading = false.obs;
  final Rx<ErrorMessageModel?> _snackbarErrorValue = Rx(null);

  AppController({required this.authPresenter}) {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => ErrorAndLoadingStateHandler(
        isLoading: _isLoading,
        snackbarErrorValue: _snackbarErrorValue,
      ).call(),
    );
  }

  bool get isLogged {
    return authPresenter.getUser() != null;
  }

  void logoff() => authPresenter.logout();

  setError(ErrorMessageModel value) {
    _isLoading.value = false;
    _snackbarErrorValue.value = value;
  }

  setIsLoading(bool isLoading) {
    _isLoading.value = isLoading;
  }
}
