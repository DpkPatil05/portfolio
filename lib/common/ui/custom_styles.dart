import 'package:flutter/material.dart';

import '../constants.dart';

class CustomStyles {
  CustomStyles._();

  static TextStyle defaultTextStyle({bool? isDarkText}) => TextStyle(
        color: (isDarkText ?? false)
            ? Constants.colors.darkText
            : Constants.colors.lightText,
        fontSize: Constants.numbers.defaultFontSize,
      );

  static TextStyle defaultHeaderStyle({bool? isDarkText}) => TextStyle(
        color: (isDarkText ?? false)
            ? Constants.colors.darkText
            : Constants.colors.lightText,
        fontSize: Constants.numbers.defaultHeaderFontSize,
        fontWeight: FontWeight.w800,
      );
}
