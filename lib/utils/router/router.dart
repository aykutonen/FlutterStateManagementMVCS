import 'package:StateManagementMVCS/utils/router/router_constants.dart';
import 'package:StateManagementMVCS/views/home/home.dart';
import 'package:StateManagementMVCS/views/onboarding/onboarding.dart';
import 'package:StateManagementMVCS/views/register/pages/notification/register_notification.dart';
import 'package:StateManagementMVCS/views/register/pages/result/register_result.dart';
import 'package:StateManagementMVCS/views/register/register.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePageRoute:
      return CupertinoPageRoute(builder: (c) => HomePage(), settings: settings);
    // case SettingPageRoute:
    //   return CupertinoPageRoute(
    //       builder: (c) => SettingsPage(), settings: settings);
    // case ReportPageRoute:
    //   return CupertinoPageRoute(
    //       builder: (c) => ReportPage(), settings: settings);
    case OnboardingPageRoute:
      return CupertinoPageRoute(
          builder: (c) => Onboarding(), settings: settings);
    case RegisterPageRoute:
      return CupertinoPageRoute(builder: (c) => Register(), settings: settings);
    case RegisterNotificationPageRoute:
      return CupertinoPageRoute(
          builder: (c) => RegisterNotification(), settings: settings);
    case RegisterResultPageRoute:
      return CupertinoPageRoute(
          builder: (c) => RegisterResult(), settings: settings);
    default:
      return CupertinoPageRoute(builder: (c) => HomePage(), settings: settings);
  }
}
