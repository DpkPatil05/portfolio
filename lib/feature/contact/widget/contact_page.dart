import 'package:flutter/material.dart';

import '../../../common/constants.dart';
import '../../landing/bloc/landing_page_bloc.dart';

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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      color: Constants.colors.backgroundColor,
      child: const Row(
        children: <Widget>[],
      ),
    );
  }
}
