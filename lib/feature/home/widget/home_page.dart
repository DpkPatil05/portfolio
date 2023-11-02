import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/common/constants.dart';
import 'package:portfolio/feature/home/bloc/home_page_bloc.dart';

import '../../../common/ui/custom_theme_data.dart';
import '../../landing/bloc/landing_page_bloc.dart';

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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      color: Constants.colors.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Expanded(
            flex: Constants.numbers.flexTwo,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Spacer(),
                Expanded(
                  flex: Constants.numbers.flexTwo,
                  child: _nameWidget,
                ),
                Spacer(flex: Constants.numbers.flexTwo),
              ],
            ),
          ),
          Spacer(flex: Constants.numbers.flexFour),
        ],
      ),
    );
  }

  Text get _nameWidget => Text(
        Constants.strings.deepakPatil,
        style: CustomThemeData.nameDisplayStyle(),
      );

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }
}
