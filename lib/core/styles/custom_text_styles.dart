import 'package:flutter/material.dart';

class CustomTextStyles {
  static TextStyle regularLink({
    Color color = Colors.red,
  }) {
    return TextStyle(
      // fontFamily: 'OpenSans',
      fontSize: 14,
      color: color,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle regularCustom({
    Color color = Colors.white,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w400,
    fontStyle = FontStyle.normal,
  }) {
    return TextStyle(
      // fontFamily: 'OpenSans',
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
    );
  }
}
