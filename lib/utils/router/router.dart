import 'package:StateManagementMVCS/utils/router/router_constants.dart';
import 'package:StateManagementMVCS/views/home_page.dart';
import 'package:StateManagementMVCS/views/onboarding_page.dart';
import 'package:StateManagementMVCS/views/onboarding_settings_page.dart';
import 'package:StateManagementMVCS/views/report_page.dart';
import 'package:StateManagementMVCS/views/settings_page.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePageRoute:
      return CupertinoPageRoute(builder: (context) => HomePage());
    case SettingPageRoute:
      return CupertinoPageRoute(builder: (context) => SettingsPage());
    case ReportPageRoute:
      return CupertinoPageRoute(builder: (context) => ReportPage());
    case OnboardingPageRoute:
      return CupertinoPageRoute(builder: (context) => OnboardingPage());
    case OnboardingSettingPageRoute:
      return CupertinoPageRoute(builder: (context) => OnboardingSettingPage());
    default:
      return CupertinoPageRoute(builder: (context) => HomePage());
  }
}