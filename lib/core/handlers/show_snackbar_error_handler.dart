import 'package:get/get.dart';

class ShowSnackBarErrorHandler {
  void call({required String text, shouldChangeStatusBarTextColor = false}) {
    Get.snackbar('Ops...', text);
  }
}
