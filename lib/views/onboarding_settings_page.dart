import 'package:flutter/cupertino.dart';

class OnboardingSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
      child: Column(
        children: [
          Text('Onboarding Setting'),
          CupertinoButton(child: Text('Go to Home Page'), onPressed: null),
        ],
      ),
    ));
  }
}
