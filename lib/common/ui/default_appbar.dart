import 'package:flutter/material.dart';

import '../constants.dart';
import 'custom_styles.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverAppBar(
        pinned: true,
        stretch: true,
        elevation: Constants.numbers.defaultElevation,
        expandedHeight: Constants.numbers.appBarExpandedHeight,
        backgroundColor: Constants.colors.secondary,
        flexibleSpace: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                Constants.images.appbarBg,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: Constants.numbers.space75,
                ),
                child: Text(
                  Constants.strings.portfolio,
                  style: CustomStyles.defaultHeaderStyle(),
                ),
              ),
            ),
          ],
        ),
      );
}
