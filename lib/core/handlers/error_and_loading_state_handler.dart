import 'package:custom_architecture/core/handlers/show_modal_loader_handler.dart';
import 'package:custom_architecture/core/handlers/show_snackbar_error_handler.dart';
import 'package:custom_architecture/core/models/error_message_model.dart';
import 'package:get/get.dart';

class ErrorAndLoadingStateHandler {
  final RxBool isLoading;
  final Rx<ErrorMessageModel?> snackbarErrorValue;

  ErrorAndLoadingStateHandler({
    required this.isLoading,
    required this.snackbarErrorValue,
  });

  void call() {
    everAll([snackbarErrorValue, isLoading], (value) {
      if (Get.isSnackbarOpen || Get.isDialogOpen!) {
        Get.back(closeOverlays: true);
      }

      if (value is ErrorMessageModel) {
        final _snackbarError = value.message;

        ShowSnackBarErrorHandler().call(
          text: _snackbarError,
        );
      } else if (value is bool) {
        _handleLoader(isLoading.value);
      }
    });
  }

  _handleLoader(bool isLoading) {
    if (isLoading) {
      ShowModalLoaderHandler()();
    }
  }
}
