enum Pages {
  homePage,
  aboutPage,
  contactPage,
}

class LandingPageState {
  LandingPageState({
    required this.page,
  });

  final Pages page;

  LandingPageState copyWith({
    Pages? page,
  }) =>
      LandingPageState(
        page: page ?? this.page,
      );
}
