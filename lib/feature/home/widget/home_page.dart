import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/feature/home/bloc/home_page_bloc.dart';

import '../../../common/ui/default_gradient_body.dart';
import '../../landing/bloc/landing_page_bloc.dart';
import '../../landing/pages_descriptor.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.landingPageBloc}) : super(key: key);
  final LandingPageBloc landingPageBloc;

  @override
  State<HomePage> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePage> {
  late final HomePageBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<HomePageBloc>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultGradientBody(
      pageNumber: Pages.homePage.index,
      children: const <Widget>[
        Row(
          children: <Widget>[],
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }
}
