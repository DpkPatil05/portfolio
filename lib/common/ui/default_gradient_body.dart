import 'package:flutter/material.dart';
import 'package:portfolio/common/constants.dart';

import 'custom_styles.dart';

class DefaultGradientBody extends StatelessWidget {
  const DefaultGradientBody({
    super.key,
    this.height,
    this.children,
    required this.pageNumber,
  });

  final double? height;
  final int pageNumber;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomStyles.defaultBackgroundGradient(
        pageNumber % Constants.numbers.modTwo ==
            Constants.numbers.remainderZero,
      ),
      child: SizedBox(
        height: height ?? MediaQuery.of(context).size.height,
        child: Column(
          children: children ?? <Widget>[],
        ),
      ),
    );
  }
}
