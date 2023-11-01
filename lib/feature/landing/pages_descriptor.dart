import '../../common/constants.dart';

enum Pages {
  homePage,
  aboutPage,
  contactPage,
}

extension PagesExtension on Pages {
  String get name => switch (this) {
        Pages.homePage => Constants.strings.home,
        Pages.aboutPage => Constants.strings.about,
        Pages.contactPage => Constants.strings.contact,
      };
}
