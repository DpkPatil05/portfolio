import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/common/ui/custom_theme_data.dart';
import 'package:portfolio/feature/landing/pages_descriptor.dart';

import '../feature/home/bloc/home_page_bloc.dart';
import '../feature/landing/bloc/landing_page_bloc.dart';
import '../feature/landing/widget/landing_page.dart';
import 'constants.dart';

class LaunchApp extends StatelessWidget {
  const LaunchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LandingPageBloc>(
            create: (context) => LandingPageBlocImpl(Pages.homePage)),
        BlocProvider<HomePageBloc>(
            create: (context) => HomePageBlocImpl(Pages.homePage)),
      ],
      child: MaterialApp(
        title: Constants.strings.deepakPatil,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        theme: CustomThemeData.defaultTheme,
        home: const LandingPage(),
      ),
    );
  }
}
