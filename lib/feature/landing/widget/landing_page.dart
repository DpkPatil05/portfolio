import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/common/constants.dart';

import '../../../common/ui/custom_appbar.dart';
import '../bloc/landing_page_bloc.dart';
import 'landing_page_body.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late final LandingPageBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<LandingPageBloc>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Constants.colors.primary,
        body: CustomScrollView(
          slivers: <Widget>[
            CustomAppBar(bloc: bloc),
            LandingPageBody(bloc: bloc),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }
}
