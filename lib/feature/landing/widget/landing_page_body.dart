import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:portfolio/common/constants.dart';
import 'package:portfolio/feature/about/widget/about_page.dart';
import 'package:portfolio/feature/contact/widget/contact_page.dart';
import 'package:portfolio/feature/home/widget/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../landing/bloc/landing_page_bloc.dart';
import '../../landing/pages_descriptor.dart';

class LandingPageBody extends StatefulWidget {
  const LandingPageBody({Key? key, required this.bloc}) : super(key: key);
  final LandingPageBloc bloc;

  @override
  State<LandingPageBody> createState() => _LandingPageBodyState();
}

class _LandingPageBodyState extends State<LandingPageBody> {
  final LiquidController _liquidController = LiquidController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SliverToBoxAdapter(
      child: BlocBuilder<LandingPageBloc, Pages>(
        builder: (context, currentActiveItem) => SizedBox(
          height: height,
          width: width,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildPageBody,
              _buildPageIndicators(currentActiveItem),
            ],
          ),
        ),
      ),
    );
  }

  LiquidSwipe get _buildPageBody => LiquidSwipe(
        enableLoop: true,
        liquidController: _liquidController,
        onPageChangeCallback: (int index) =>
            widget.bloc.onPageChange(Pages.values[index]),
        pages: <Widget>[
          HomePage(landingPageBloc: widget.bloc),
          AboutPage(landingPageBloc: widget.bloc),
          ContactPage(landingPageBloc: widget.bloc),
        ],
      );

  Widget _buildPageIndicators(Pages currentActiveItem) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _liquidController.animateToPage(page: currentActiveItem.index);
    });
    return Column(
      children: [
        Expanded(
          flex: Constants.numbers.flexFour,
          child: Padding(
            padding: EdgeInsets.only(left: Constants.numbers.space50),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: AnimatedSmoothIndicator(
                axisDirection: Axis.vertical,
                activeIndex: currentActiveItem.index,
                count: Pages.values.length,
                effect: WormEffect(
                  activeDotColor: Constants.colors.primary,
                  dotColor: Constants.colors.tertiary,
                  dotHeight: Constants.numbers.space16,
                  dotWidth: Constants.numbers.space16,
                  spacing: Constants.numbers.space20,
                  strokeWidth: Constants.numbers.space3,
                  paintStyle: PaintingStyle.stroke,
                ),
                onDotClicked: (int index) {
                  widget.bloc.onPageChange(Pages.values[index]);
                  _liquidController.animateToPage(page: index);
                },
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
