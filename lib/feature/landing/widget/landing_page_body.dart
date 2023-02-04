import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:portfolio/common/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandingPageBody extends StatefulWidget {
  const LandingPageBody({Key? key}) : super(key: key);

  @override
  State<LandingPageBody> createState() => _LandingPageBodyState();
}

class _LandingPageBodyState extends State<LandingPageBody> {
  final LiquidController _liquidController = LiquidController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SliverToBoxAdapter(
      child: StatefulBuilder(builder: (context, setLiquidSwipeState) {
        return Stack(
          children: <Widget>[
            LiquidSwipe(
              enableLoop: true,
              ignoreUserGestureWhileAnimating: true,
              liquidController: _liquidController,
              onPageChangeCallback: (int index) => setLiquidSwipeState,
              pages: <Widget>[
                Container(
                  height: height,
                  color: Colors.deepOrange,
                ),
                Container(
                  height: height,
                  color: Colors.deepPurple,
                ),
                Container(
                  height: height,
                  color: Colors.green,
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: AnimatedSmoothIndicator(
                axisDirection: Axis.vertical,
                activeIndex: _liquidController.currentPage,
                count: Constants.numbers.maxPagesCount,
                effect: SwapEffect(
                  activeDotColor: Constants.colors.secondary,
                  dotColor: Constants.colors.tertiary,
                  dotHeight: Constants.numbers.space16,
                  dotWidth: Constants.numbers.space16,
                  type: SwapType.yRotation,
                  paintStyle: PaintingStyle.stroke,
                  strokeWidth: Constants.numbers.space2,
                ),
                onDotClicked: (int index) => setLiquidSwipeState(
                  () => _liquidController.animateToPage(page: index),
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
    super.dispose();
  }
}
