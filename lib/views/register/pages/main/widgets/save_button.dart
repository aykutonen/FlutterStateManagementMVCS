import 'package:StateManagementMVCS/commands/register_command.dart';
import 'package:StateManagementMVCS/utils/router/router_constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterSaveButton extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  const RegisterSaveButton(this.formKey);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton(
        child: Text('Save'),
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            RegisterCommand()
                .calculateTargetAndSaveToModel(formKey.currentState.value);

            Navigator.pushNamed(context, RegisterResultPageRoute);
          }
        },
        color: CupertinoColors.activeGreen,
      ),
    );
  }
}
