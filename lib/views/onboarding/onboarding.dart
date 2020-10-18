import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/views/onboarding/pages/name/name.dart';
import 'package:StateManagementMVCS/views/onboarding/pages/sleep/sleep.dart';
import 'package:StateManagementMVCS/views/onboarding/pages/targetamount/targetamount.dart';
import 'package:StateManagementMVCS/views/onboarding/pages/unit/unit.dart';
import 'package:StateManagementMVCS/views/onboarding/pages/wakeup/wakeup.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentPage = 0;
  final int _lastPage = 4;

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
            name == null ? Text('') : Text('Hi $name'),
            Expanded(child: _getPage()),
            // Text('current page: $_currentPage'),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     CupertinoButton(
            //       child: Text('Previous'),
            //       onPressed: _setPreviousPage,
            //     ),
            //     CupertinoButton(
            //       child: Text('Next'),
            //       onPressed: _setNextPage,
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
