import 'package:StateManagementMVCS/commands/register_command.dart';
import 'package:StateManagementMVCS/models/register_model.dart';
import 'package:StateManagementMVCS/models/view_model/register_form_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';
import 'package:StateManagementMVCS/utils/router/router_constants.dart';
import 'package:StateManagementMVCS/views/home/widgets/seperator.dart';
import 'package:StateManagementMVCS/views/register/pages/result/widgets/back_button.dart';
import 'package:StateManagementMVCS/views/register/pages/result/widgets/calculated_target.dart';
import 'package:StateManagementMVCS/views/register/pages/result/widgets/caption.dart';
import 'package:StateManagementMVCS/views/register/pages/result/widgets/save_button.dart';
import 'package:StateManagementMVCS/views/register/pages/result/widgets/title.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model =
        context.select<RegisterModel, RegisterFormModel>((c) => c.formModel);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegisterBackButton(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        RegisterResultTitle('Your Calculated Target Amount'),
                        RegisterResultCalculatedTarget(
                            "${model.target.toString()} ${model.waterUnit.name.toUpperCase()}"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RegisterResultSaveButton('Looks Good'),
                        const Seperator(height: 20.0),
                        RegisterResultCaption(
                            'You can change target amount on settings page.'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
