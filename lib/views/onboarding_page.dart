import 'package:StateManagementMVCS/utils/router/router_constants.dart';
import 'package:flutter/cupertino.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _handleGoToPressed() {
      Navigator.pushNamed(context, OnboardingSettingPageRoute);
    }

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Onboarding'),
              CupertinoButton(
                  child: Text('Go to Onboarding Setting'),
                  onPressed: _handleGoToPressed),
            ],
          ),
        ),
      ),
    );
  }
}
