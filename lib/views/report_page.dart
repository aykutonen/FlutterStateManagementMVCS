import 'package:StateManagementMVCS/routing_constants.dart';
import 'package:flutter/cupertino.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Report'),
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
