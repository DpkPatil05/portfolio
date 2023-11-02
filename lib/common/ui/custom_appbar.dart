import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/common/ui/custom_theme_data.dart';
import 'package:portfolio/common/ui/text_icon_button.dart';

import '../../feature/landing/bloc/landing_page_bloc.dart';
import '../../feature/landing/pages_descriptor.dart';
import '../constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.bloc}) : super(key: key);
  final LandingPageBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandingPageBloc, Pages>(
      builder: (context, page) => SliverAppBar(
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
            _buildAppBarItems(page, bloc)
          ],
        ),
      ),
    );
  }

  IconData _getIconForTextButton({
    required Pages navbarItem,
    required Pages currentActiveItem,
  }) =>
      switch (navbarItem) {
        Pages.homePage => currentActiveItem == Pages.homePage
            ? Icons.home
            : Icons.home_outlined,
        Pages.aboutPage => currentActiveItem == Pages.aboutPage
            ? Icons.info_rounded
            : Icons.info_outline_rounded,
        Pages.contactPage => currentActiveItem == Pages.contactPage
            ? Icons.phone
            : Icons.phone_outlined
      };

  Widget _buildIconTextButton({
    required Pages navbarItem,
    required Pages currentActiveItem,
    required LandingPageBloc bloc,
  }) =>
      Expanded(
        flex: Constants.numbers.flexTwo,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextIconButton(
              icon: CustomThemeData.defaultIcon(
                iconData: _getIconForTextButton(
                    navbarItem: navbarItem,
                    currentActiveItem: currentActiveItem),
                isSelected: navbarItem == currentActiveItem,
              ),
              isActive: currentActiveItem == navbarItem,
              text: navbarItem.name,
              onPressed: () => bloc.onPageChange(navbarItem),
            ),
          ],
        ),
      );

  Align _buildAppBarItems(Pages page, LandingPageBloc bloc) => Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.only(bottom: Constants.numbers.space8),
          child: Row(
            children: <Widget>[
              _buildIconTextButton(
                navbarItem: Pages.homePage,
                currentActiveItem: page,
                bloc: bloc,
              ),
              _buildIconTextButton(
                navbarItem: Pages.aboutPage,
                currentActiveItem: page,
                bloc: bloc,
              ),
              _buildIconTextButton(
                navbarItem: Pages.contactPage,
                currentActiveItem: page,
                bloc: bloc,
              ),
              Spacer(flex: Constants.numbers.flexFive),
            ],
          ),
        ),
      );
}
