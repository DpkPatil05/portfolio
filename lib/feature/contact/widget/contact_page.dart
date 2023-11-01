import 'package:flutter/material.dart';

import '../../../common/ui/default_gradient_body.dart';
import '../../landing/bloc/landing_page_bloc.dart';
import '../../landing/pages_descriptor.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key, required this.landingPageBloc})
      : super(key: key);
  final LandingPageBloc landingPageBloc;

  @override
  State<ContactPage> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultGradientBody(
      pageNumber: Pages.contactPage.index,
      children: const <Widget>[
        Row(
          children: <Widget>[],
        ),
      ],
    );
  }
}
