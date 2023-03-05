import 'package:flutter/material.dart';

import '../constants.dart';
import 'custom_styles.dart';

class SelectableIconTextButton extends StatelessWidget {
  const SelectableIconTextButton({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
  });

  final String icon;
  final bool? isSelected;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // TODO (Deepak): Need to change icons with sag's
          (isSelected ?? false)
              ? Icon(
                  Icons.home,
                  color: Constants.colors.tertiary,
                )
              : Icon(
                  Icons.home_outlined,
                  color: Constants.colors.tertiary,
                ),
          SizedBox(
            width: Constants.numbers.space8,
          ),
          Text(
            Constants.strings.contact,
            style: CustomStyles.defaultTextStyle(),
          ),
        ],
      ),
    );
  }
}
