import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CustomTextStyles {
  static TextStyle regularLink({
    Color color = CustomColors.BRAND_PRIMARY_40,
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
    Color color = CustomColors.SUPPORT_NEUTRAL_10,
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
