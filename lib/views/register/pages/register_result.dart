import 'package:StateManagementMVCS/models/register_model.dart';
import 'package:StateManagementMVCS/models/view_model/register_form_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// TODO: Kullanıcı onaylarsa home'a yönlendir. Başlangıç verilerinin yüklenip yüklenmediğini kontrol et.

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
                    flex: 3,
                    child: Center(
                      // widthFactor: 1,
                      child: CupertinoButton(
                        child: Text('Looks Good'),
                        color: CupertinoColors.activeGreen,
                        onPressed: () {},
                      ),
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
