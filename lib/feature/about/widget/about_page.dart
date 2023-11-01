import 'package:flutter/material.dart';

import '../../../common/ui/default_gradient_body.dart';
import '../../landing/bloc/landing_page_bloc.dart';
import '../../landing/pages_descriptor.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key, required this.landingPageBloc}) : super(key: key);
  final LandingPageBloc landingPageBloc;

  @override
  State<AboutPage> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultGradientBody(
      pageNumber: Pages.aboutPage.index,
      children: const <Widget>[
        Row(
          children: <Widget>[],
        ),
      ],
    );
  }
}
