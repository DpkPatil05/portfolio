import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:portfolio/common/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../common/ui/default_gradient_body.dart';
import '../../../models/landing_page_state.dart';
import '../bloc/landing_page_bloc.dart';

class LandingPageBody extends StatefulWidget {
  const LandingPageBody({Key? key}) : super(key: key);

  @override
  State<LandingPageBody> createState() => _LandingPageBodyState();
}

class _LandingPageBodyState extends State<LandingPageBody> {
  final LiquidController _liquidController = LiquidController();
  late final LandingPageBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<LandingPageBloc>(
      context,
      listen: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SliverToBoxAdapter(
      child: StreamBuilder<LandingPageState?>(
          stream: _bloc.screenState,
          builder: (context, snapshot) {
            Pages currentPage = Pages.homePage;
            if (snapshot.hasData && snapshot.data != null) {
              currentPage = snapshot.data!.page;
            }
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                LiquidSwipe(
                  enableLoop: true,
                  liquidController: _liquidController,
                  onPageChangeCallback: (int index) =>
                      _bloc.page = Pages.values[index],
                  pages: <Widget>[
                    DefaultGradientBody(
                      height: height,
                      pageNumber: currentPage.index,
                      children: [],
                    ),
                    DefaultGradientBody(
                      height: height,
                      pageNumber: currentPage.index,
                      children: [],
                    ),
                    DefaultGradientBody(
                      height: height,
                      pageNumber: currentPage.index,
                      children: [],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: Constants.numbers.space50,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AnimatedSmoothIndicator(
                      axisDirection: Axis.vertical,
                      activeIndex: currentPage.index,
                      count: Constants.numbers.maxPagesCount,
                      effect: WormEffect(
                        activeDotColor: Constants.colors.secondary,
                        dotColor: Constants.colors.tertiary,
                        dotHeight: Constants.numbers.space16,
                        dotWidth: Constants.numbers.space16,
                        spacing: Constants.numbers.space20,
                        strokeWidth: Constants.numbers.space2,
                        paintStyle: PaintingStyle.stroke,
                      ),
                      onDotClicked: (int index) =>
                          _liquidController.animateToPage(page: index),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
