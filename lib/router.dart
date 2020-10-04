import 'package:StateManagementMVCS/routing_constants.dart';
import 'package:StateManagementMVCS/views/home_page.dart';
import 'package:StateManagementMVCS/views/onboarding_page.dart';
import 'package:StateManagementMVCS/views/onboarding_settings_page.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePageRoute:
      return CupertinoPageRoute(builder: (context) => HomePage());
    case SettingPageRoute:
      return CupertinoPageRoute(
          builder: (context) => HomePage()); // TODO: Setting sayfasını tanımla
    case ReportPageRoute:
      return CupertinoPageRoute(
          builder: (context) => HomePage()); // TODO: Report sayfasını tanımla
    default:
      return CupertinoPageRoute(builder: (context) => HomePage());
  }
}

Route<dynamic> generateRouteOnboarding(RouteSettings settings) {
  switch (settings.name) {
    case HomePageRoute:
      return CupertinoPageRoute(builder: (context) => HomePage());
    case OnboardingPageRoute:
      return CupertinoPageRoute(builder: (context) => Onboarding());
    case OnboardingSettingPageRoute:
      return CupertinoPageRoute(builder: (context) => OnboardingSetting());
    default:
      return CupertinoPageRoute(builder: (context) => Onboarding());
  }
}
