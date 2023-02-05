import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/common/constants.dart';

import 'feature/landing/bloc/landing_page_bloc.dart';
import 'feature/landing/widget/landing_page.dart';
import 'models/landing_page_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LandingPageBloc>(
          create: (context) => LandingPageBlocImpl(
            LandingPageState(
              page: Pages.homePage,
            ),
          ),
        ),
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
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Constants.colors.primary,
            secondary: Constants.colors.secondary,
            tertiary: Constants.colors.tertiary,
          ),
        ),
        home: const LandingPage(),
      ),
    );
  }
}
