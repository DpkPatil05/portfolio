import 'package:flutter/material.dart';
import 'package:portfolio/common/constants.dart';

import '../../../common/ui/default_appbar.dart';
import 'landing_page_body.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.colors.primary,
        body: const CustomScrollView(
          slivers: <Widget>[
            DefaultAppBar(),
            LandingPageBody(),
          ],
        ),
      ),
    );
  }
}
