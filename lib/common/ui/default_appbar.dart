import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/common/ui/custom_styles.dart';
import 'package:portfolio/common/ui/selectable_icon_text_button.dart';

import '../../feature/landing/bloc/landing_page_bloc.dart';
import '../../models/landing_page_state.dart';
import '../constants.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LandingPageBloc bloc = BlocProvider.of<LandingPageBloc>(
      context,
      listen: false,
    );
    return StreamBuilder<LandingPageState?>(
        stream: bloc.screenState,
        builder: (context, snapshot) {
          final LandingPageState? data = snapshot.data;
          Pages currentPage = Pages.homePage;
          if (data != null) {
            currentPage = data.page;
          }
          return SliverAppBar(
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
                        IconTextButton(
                          icon: currentPage == Pages.homePage
                              ? CustomStyles.defaultIcon(
                                  iconData: Icons.home,
                                  isSelected: currentPage == Pages.homePage,
                                )
                              : CustomStyles.defaultIcon(
                                  iconData: Icons.home_outlined,
                                  isSelected: currentPage == Pages.homePage,
                                ),
                          isSelected: currentPage == Pages.homePage,
                          text: Constants.strings.home,
                          onPressed: () => bloc.page = Pages.homePage,
                        ),
                        IconTextButton(
                          icon: currentPage == Pages.aboutPage
                              ? CustomStyles.defaultIcon(
                                  iconData: Icons.info_rounded,
                                  isSelected: currentPage == Pages.aboutPage,
                                )
                              : CustomStyles.defaultIcon(
                                  iconData: Icons.info_outline_rounded,
                                  isSelected: currentPage == Pages.aboutPage,
                                ),
                          isSelected: currentPage == Pages.aboutPage,
                          text: Constants.strings.about,
                          onPressed: () => bloc.page = Pages.aboutPage,
                        ),
                        IconTextButton(
                          icon: currentPage == Pages.contactPage
                              ? CustomStyles.defaultIcon(
                                  iconData: Icons.phone,
                                  isSelected: currentPage == Pages.contactPage,
                                )
                              : CustomStyles.defaultIcon(
                                  iconData: Icons.phone_outlined,
                                  isSelected: currentPage == Pages.contactPage,
                                ),
                          isSelected: currentPage == Pages.contactPage,
                          text: Constants.strings.contact,
                          onPressed: () => bloc.page = Pages.contactPage,
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
        });
  }
}
