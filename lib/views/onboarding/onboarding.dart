import 'package:StateManagementMVCS/views/onboarding/pages/name/name.dart';
import 'package:StateManagementMVCS/views/onboarding/pages/sleep/sleep.dart';
import 'package:StateManagementMVCS/views/onboarding/pages/targetamount/targetamount.dart';
import 'package:StateManagementMVCS/views/onboarding/pages/unit/unit.dart';
import 'package:StateManagementMVCS/views/onboarding/pages/wakeup/wakeup.dart';
import 'package:flutter/cupertino.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentPage = 0;

  var _pages = [
    OnboardingNamePage(),
    OnboardingSleepPage(),
    OnboardingWakeUpPage(),
    OnboardingUnitPage(),
    OnboardingTargetAmountPage()
  ];

  Widget _getPage() {
    return _pages[_currentPage];
  }

  void _setNextPage() {
    setState(() {
      if (_currentPage == _pages.length - 1) {
        _currentPage = 0;
      } else {
        _currentPage++;
      }
    });
  }

  void _setPreviousPage() {
    setState(() {
      if (_currentPage == 0) {
        _currentPage = _pages.length - 1;
      } else {
        _currentPage--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(child: _getPage()),
            Text('current page: $_currentPage'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                    child: Text('Previous'), onPressed: _setPreviousPage),
                CupertinoButton(child: Text('Next'), onPressed: _setNextPage),
              ],
            )
          ],
        ),
      ),
    );
  }
}
