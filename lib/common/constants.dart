import 'dart:ui';

abstract class Constants {
  static NumberConstants numbers = NumberConstants();
  static final StringConstants strings = StringConstants();
  static final ImageConstants images = ImageConstants();
  static final ColorConstants colors = ColorConstants();
}

/// Used for defining all number constants
class NumberConstants {
  final int mod2 = 2;
  final int remainder0 = 0;
  final int maxPagesCount = 3;

  final double space1 = 1.0;
  final double space2 = 2.0;
  final double space3 = 3.0;
  final double space4 = 4.0;
  final double space5 = 5.0;
  final double space8 = 8.0;
  final double space16 = 16.0;
  final double space20 = 20.0;
  final double space24 = 24.0;
  final double space50 = 50.0;
  final double space75 = 75.0;

  final double defaultFontSize = 18.0;
  final double defaultHeaderFontSize = 24.0;
  final double defaultElevation = 1.0;

  final double appBarExpandedHeight = 200.0;
  final double baseHeightAdjustment = 0.79;
}

/// Used for defining all string constants
class StringConstants {
  final String portfolio = 'Portfolio';
  final String deepakPatil = 'Deepak Patil';
}

/// Used for defining all image paths
class ImageConstants {
  static const String defaultImagePath = 'assets/images';

  final String appbarBg = '$defaultImagePath/appbar-bg.jpg';
}

/// Used for defining all colour constants
class ColorConstants {
  // Default color scheme for the app
  final Color primary = const Color(0xff0543d8);
  final Color secondary = const Color(0xffba000d);
  final Color tertiary = const Color(0xffffffff);

  final Color lightText = const Color(0xffffffff);
  final Color darkText = const Color(0xff0f0e0e);
}
