import 'package:custom_architecture/core/handlers/show_modal_loader_handler.dart';
import 'package:custom_architecture/core/handlers/show_snackbar_error_handler.dart';
import 'package:get/get.dart';

class ErrorAndLoadingStateHandler {
  final RxBool isLoading;
  final RxString snackbarErrorValue;

  ErrorAndLoadingStateHandler({
    required this.isLoading,
    required this.snackbarErrorValue,
  });

  void call() {
    everAll([snackbarErrorValue, isLoading], (value) {
      if (value is String && value.isNotEmpty) {
        _closeDialogIfOpen();

        _closeSnackBarIfOpen();

        final _snackbarError = value;

        ShowSnackBarErrorHandler().call(
          text: _snackbarError,
        );
      } else if (value is bool) {
        _handleLoader(isLoading.value);
      }
    },
        condition: (value) =>
            (value is String && value.isNotEmpty) || value is bool);
  }

  _handleLoader(bool isLoading) {
    if (isLoading && !Get.isDialogOpen!) {
      ShowModalLoaderHandler()();
    } else {
      _closeDialogIfOpen();
    }
  }

  _closeDialogIfOpen() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

  _closeSnackBarIfOpen() {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
  }
}
