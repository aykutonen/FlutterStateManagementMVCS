import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/commands/refresh_posts_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/routing_constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class OnboardingSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _handleGoToPressed() async {
      await AppCommand().saveIsFirstTime(false);
      await AppCommand().saveUsername("Aykut");
      await RefreshPostsCommand().run(context.read<AppModel>().currentUser);
      Navigator.pushNamed(context, HomePageRoute);
    }

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Onboarding Setting'),
              CupertinoButton(
                child: Text('Go to Home Page'),
                onPressed: _handleGoToPressed,
              )
            ],
          ),
        ),
      ),
    );
  }
}
