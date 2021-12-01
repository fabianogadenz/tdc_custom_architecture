import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowModalLoaderHandler {
  final Color color;

  ShowModalLoaderHandler({
    this.color = Colors.green,
  });

  call() {
    Get.dialog(
      Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 5,
            maxHeight: 50,
            minWidth: 5,
          ),
          child: Image.asset(
            'assets/images/pingpong_fill_logo.png',
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
