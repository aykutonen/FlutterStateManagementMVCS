import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/commands/refresh_posts_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/utils/router/router_constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingSettingPage extends StatelessWidget {
  final nameController = TextEditingController();

  void showAlertDialog(BuildContext context, String title, String content) {
    showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            content: Text(content),
            title: Text(title),
            actions: [
              CupertinoDialogAction(
                child: Text('Ok'),
                isDefaultAction: true,
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    void _handleGoToPressed() async {
      if (nameController.text.length == 0) {
        showAlertDialog(context, 'İsim', 'Lütfen boş bırakmayın');
      } else {
        // await AppCommand().saveIsFirstTime(false);
        await AppCommand().saveUsername(nameController.text);
        // await RefreshPostsCommand().run(context.read<AppModel>().currentUser);
        // Navigator.pushNamed(context, HomePageRoute);
      }
    }

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Onboarding Setting'),
              Text('Enter Name...'),
              CupertinoTextField(
                controller: nameController,
              ),
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
