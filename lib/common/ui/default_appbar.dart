import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                        SelectableIconTextButton(
                          icon: '',
                          isSelected: currentPage == Pages.homePage,
                          onPressed: () => bloc.page = Pages.homePage,
                        ),
                        SelectableIconTextButton(
                          icon: '',
                          isSelected: currentPage == Pages.aboutPage,
                          onPressed: () => bloc.page = Pages.aboutPage,
                        ),
                        SelectableIconTextButton(
                          icon: '',
                          isSelected: currentPage == Pages.contactPage,
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
