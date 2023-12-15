import 'dart:ui';

import 'package:flutter/material.dart';

abstract class Constants {
  static NumberConstants numbers = NumberConstants();
  static final StringConstants strings = StringConstants();
  static final ImageConstants images = ImageConstants();
  static final ColorConstants colors = ColorConstants();
}

/// Used for defining all number constants
class NumberConstants {
  // Flex values
  final int flexTwo = 2;
  final int flexThree = 3;
  final int flexFour = 4;
  final int flexFive = 5;

  final int modTwo = 2;
  final int remainderZero = 0;

  final double space1 = 1.0;
  final double space2 = 2.0;
  final double space3 = 3.0;
  final double space4 = 4.0;
  final double space5 = 5.0;
  final double space6 = 6.0;
  final double space8 = 8.0;
  final double space16 = 16.0;
  final double space20 = 20.0;
  final double space24 = 24.0;
  final double space36 = 36.0;
  final double space42 = 42.0;
  final double space48 = 48.0;
  final double space50 = 50.0;
  final double space75 = 75.0;

  final double defaultFontSize = 18.0;
  final double defaultFontSizeSmall = 14.0;
  final double defaultHeaderFontSize = 24.0;
  final double nameDisplayFontSize = 70.0;
  final double defaultElevation = 1.0;

  final double appBarExpandedHeight = 200.0;
  final double baseHeightAdjustment = 0.79;
}

/// Used for defining all string constants
class StringConstants {
  // Fonts
  final String fontLeagueSpartan = 'LeagueSpartan';
  final String fontPrompt = 'Prompt';

  final String portfolio = 'Portfolio';
  final String deepakPatil = 'Deepak Patil';
  final String home = 'home';
  final String about = 'about';
  final String contact = 'contact';
}

/// Used for defining all image paths
class ImageConstants {
  static const String defaultImagePath = 'assets/images';

  final String appbarBg = '$defaultImagePath/appbar-bg.jpg';
}

/// Used for defining all colour constants
class ColorConstants {
  // Default color scheme for the app
  final Color primary = const Color(0xff2962ff);
  final Color secondary = const Color(0xffba000d);
  final Color tertiary = const Color(0xffffffff);

  final Color backgroundColor = const Color(0xff181db8);
  final Color lightText = const Color(0xffffffff);
  final Color darkText = const Color(0xff0f0e0e);
  final Color deepBlack = const Color(0xff000000);
}
