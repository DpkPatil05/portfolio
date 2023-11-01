import 'package:flutter/material.dart';

import '../constants.dart';
import 'custom_styles.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
    this.isActive = false,
  });

  final Icon icon;
  final String text;
  final void Function()? onPressed;
  final bool? isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          icon,
          SizedBox(width: Constants.numbers.space6),
          Text(
            text,
            style: isActive ?? false
                ? CustomStyles.defaultHeaderStyle()
                : CustomStyles.defaultTextStyle(),
          ),
        ],
      ),
    );
  }
}
