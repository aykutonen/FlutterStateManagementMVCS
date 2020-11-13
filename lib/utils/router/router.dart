import 'package:StateManagementMVCS/utils/router/router_constants.dart';
import 'package:StateManagementMVCS/views/home/home.dart';
import 'package:StateManagementMVCS/views/onboarding/onboarding.dart';
import 'package:StateManagementMVCS/views/register/pages/register_result.dart';
import 'package:StateManagementMVCS/views/register/register.dart';
import 'package:StateManagementMVCS/views/report_page.dart';
import 'package:StateManagementMVCS/views/settings_page.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePageRoute:
      return CupertinoPageRoute(builder: (c) => HomePage());
    case SettingPageRoute:
      return CupertinoPageRoute(builder: (c) => SettingsPage());
    case ReportPageRoute:
      return CupertinoPageRoute(builder: (c) => ReportPage());
    case OnboardingPageRoute:
      return CupertinoPageRoute(builder: (c) => Onboarding());
    case RegisterPageRoute:
      return CupertinoPageRoute(builder: (c) => Register());
    case RegisterResultPageRoute:
      return CupertinoPageRoute(builder: (c) => RegisterResult());
    default:
      return CupertinoPageRoute(builder: (c) => HomePage());
  }
}
