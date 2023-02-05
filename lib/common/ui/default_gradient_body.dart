import 'package:flutter/material.dart';
import 'package:portfolio/common/constants.dart';

import 'custom_styles.dart';

class DefaultGradientBody extends StatelessWidget {
  const DefaultGradientBody({
    super.key,
    this.height,
    required this.pageNumber,
    required this.children,
  });

  final double? height;
  final int pageNumber;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height,
      decoration: CustomStyles.defaultBackgroundGradient(
        pageNumber % Constants.numbers.mod2 == Constants.numbers.remainder0,
      ),
    );
  }
}
