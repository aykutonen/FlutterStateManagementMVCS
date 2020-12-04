import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/views/onboarding/pages/name/name.dart';
import 'package:StateManagementMVCS/views/onboarding/pages/sleep/sleep.dart';
import 'package:StateManagementMVCS/views/onboarding/pages/targetamount/targetamount.dart';
import 'package:StateManagementMVCS/views/onboarding/pages/unit/unit.dart';
import 'package:StateManagementMVCS/views/onboarding/pages/wakeup/wakeup.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentPage = 0;
  final int _lastPage = 4;

  @override
  void initState() {
    super.initState();
  }

  Widget _getPage() {
    switch (_currentPage) {
      case 0:
        return OnboardingNamePage(
          onNextPressed: _setNextPage,
        );
      case 1:
        return OnboardingSleepPage(
          onNextPressed: _setNextPage,
          onPreviousPressed: _setPreviousPage,
        );
      case 2:
        return OnboardingWakeUpPage(
          onNextPressed: _setNextPage,
          onPreviousPressed: _setPreviousPage,
        );
      case 3:
        return OnboardingUnitPage(
          onNextPressed: _setNextPage,
          onPreviousPressed: _setPreviousPage,
        );
      case 4:
        return OnboardingTargetAmountPage(
          onNextPressed: _setNextPage,
          onPreviousPressed: _setPreviousPage,
        );
      default:
        return null;
    }
  }

  void _setNextPage() {
    if (_currentPage != _lastPage) setState(() => _currentPage++);
  }

  void _setPreviousPage() {
    if (_currentPage != 0) setState(() => _currentPage--);
  }

  @override
  Widget build(BuildContext context) {
    String name = context.select<AppModel, String>((e) => e.currentUser);

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            if (name != null) Text('hi_user').tr(args: [name]),
            Expanded(child: _getPage()),
          ],
        ),
      ),
    );
  }
}
