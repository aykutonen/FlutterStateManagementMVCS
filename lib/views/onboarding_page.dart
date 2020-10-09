import 'package:StateManagementMVCS/routing_constants.dart';
import 'package:flutter/cupertino.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Onboarding'),
              CupertinoButton(
                  child: Text('Go to Onboarding Setting'),
                  onPressed: () {
                    Navigator.pushNamed(context, OnboardingSettingPageRoute);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
