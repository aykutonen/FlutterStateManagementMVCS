import 'package:StateManagementMVCS/commands/register_command.dart';
import 'package:StateManagementMVCS/models/register_model.dart';
import 'package:StateManagementMVCS/models/view_model/register_form_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';
import 'package:StateManagementMVCS/utils/router/router_constants.dart';
import 'package:StateManagementMVCS/views/home/widgets/seperator.dart';

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
            CupertinoButton(
              child: Icon(CupertinoIcons.back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
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
                        Text(
                          'Your Calculated Target Amount',
                          style: Theme.of(context).textTheme.headline4,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "${model.target.toString()} ${model.waterUnit.name.toUpperCase()}",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoButton(
                          child: Text('Looks Good'),
                          color: CupertinoColors.activeGreen,
                          onPressed: () async {
                            await RegisterCommand().save();

                            await Navigator.pushNamedAndRemoveUntil(
                                context, HomePageRoute, (route) => false);
                          },
                        ),
                        Seperator(height: 20.0),
                        Text(
                          'You can change target amount on settings page.',
                          style: Theme.of(context).textTheme.caption,
                        ),
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
