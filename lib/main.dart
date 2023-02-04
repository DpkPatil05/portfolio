import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/common/constants.dart';

import 'feature/landing/widget/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.strings.deepakPatil,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Constants.colors.primary,
          secondary: Constants.colors.secondary,
          tertiary: Constants.colors.tertiary,
        ),
      ),
      home: const LandingPage(),
    );
  }
}
