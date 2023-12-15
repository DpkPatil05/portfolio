import 'package:flutter/material.dart';

import '../constants.dart';

class CustomThemeData {
  CustomThemeData._();

  static ThemeData get defaultTheme => ThemeData(
        fontFamily: Constants.strings.fontPrompt,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Constants.colors.primary,
          secondary: Constants.colors.secondary,
          tertiary: Constants.colors.tertiary,
        ),
      );

  static TextStyle defaultTextStyle({bool? isDarkText}) => TextStyle(
        color: (isDarkText ?? false)
            ? Constants.colors.darkText
            : Constants.colors.lightText,
        fontSize: Constants.numbers.defaultFontSize,
        fontWeight: FontWeight.w500,
      );

  static TextStyle defaultTextStyleSmall({bool? isDarkText}) => TextStyle(
        color: (isDarkText ?? false)
            ? Constants.colors.darkText
            : Constants.colors.lightText,
        fontSize: Constants.numbers.defaultFontSizeSmall,
        fontWeight: FontWeight.w400,
      );

  static TextStyle defaultHeaderStyle({bool? isDarkText}) => TextStyle(
        color: (isDarkText ?? false)
            ? Constants.colors.darkText
            : Constants.colors.lightText,
        fontSize: Constants.numbers.defaultHeaderFontSize,
        fontWeight: FontWeight.w800,
      );

  static TextStyle nameDisplayStyle({bool? isDarkText}) => TextStyle(
        color: (isDarkText ?? false)
            ? Constants.colors.darkText
            : Constants.colors.lightText,
        fontSize: Constants.numbers.nameDisplayFontSize,
        fontWeight: FontWeight.w800,
        fontFamily: Constants.strings.fontLeagueSpartan,
        letterSpacing: Constants.numbers.space8,
        shadows: [
          Shadow(
            color: Constants.colors.deepBlack,
            offset: Offset(
              -Constants.numbers.space4,
              -Constants.numbers.space1,
            ),
            blurRadius: Constants.numbers.space4,
          ),
        ],
      );

  static Icon defaultIcon({
    required IconData iconData,
    bool? isSelected = false,
  }) =>
      Icon(
        iconData,
        color: (isSelected ?? false)
            ? Constants.colors.primary
            : Constants.colors.tertiary,
        size: (isSelected ?? false) ? Constants.numbers.space36 : null,
      );
}
