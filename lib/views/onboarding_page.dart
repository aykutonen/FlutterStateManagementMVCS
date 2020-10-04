import 'package:flutter/cupertino.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
      child: Column(
        children: [
          Text('Onboarding'),
          CupertinoButton(
              child: Text('Go to Onboarding Setting'), onPressed: null),
        ],
      ),
    ));
  }
}
