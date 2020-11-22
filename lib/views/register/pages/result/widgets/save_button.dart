import 'package:StateManagementMVCS/commands/register_command.dart';
import 'package:StateManagementMVCS/utils/router/router_constants.dart';
import 'package:flutter/cupertino.dart';

class RegisterResultSaveButton extends StatelessWidget {
  final String text;

  const RegisterResultSaveButton(this.text);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text(text),
      color: CupertinoColors.activeGreen,
      onPressed: () async {
        await RegisterCommand().save();
        Navigator.pushNamed(context, RegisterNotificationPageRoute);
      },
    );
  }
}
