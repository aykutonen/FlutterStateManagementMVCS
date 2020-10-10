import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/commands/refresh_posts_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/routing_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // AppCommand().load();
    // if (!context.select<AppModel, bool>((v) => v.isFirstTime)) {
    //   RefreshPostsCommand()
    //       .run(context.read<AppModel>().currentUser)
    //       .then((value) => Navigator.pushNamed(context, HomePageRoute));
    // }

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
