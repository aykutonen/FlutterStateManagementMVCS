import 'package:StateManagementMVCS/routing_constants.dart';
import 'package:flutter/cupertino.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Settings'),
              CupertinoButton(
                  child: Text('Go to Home'),
                  onPressed: () {
                    Navigator.pushNamed(context, HomePageRoute);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
