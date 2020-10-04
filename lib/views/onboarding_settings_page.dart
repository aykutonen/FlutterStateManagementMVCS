import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/commands/refresh_posts_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/routing_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class OnboardingSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
      child: Column(
        children: [
          Text('Onboarding Setting'),
          CupertinoButton(
              child: Text('Go to Home Page'),
              onPressed: () async {
                await AppCommand().saveIsFirstTime(false);
                await RefreshPostsCommand()
                    .run(context.read<AppModel>().currentUser);
                Navigator.pushNamed(context, HomePageRoute);
              }),
        ],
      ),
    ));
  }
}
