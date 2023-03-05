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
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: Constants.numbers.space8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        Constants.strings.home,
                        style: CustomStyles.defaultTextStyle(),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        Constants.strings.about,
                        style: CustomStyles.defaultTextStyle(),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        Constants.strings.contact,
                        style: CustomStyles.defaultTextStyle(),
                      ),
                    ),
                    const SizedBox.shrink(),
                    const SizedBox.shrink(),
                    const SizedBox.shrink(),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
