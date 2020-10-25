import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/views/home/widgets/big_title.dart';
import 'package:StateManagementMVCS/views/home/widgets/seperator.dart';
import 'package:StateManagementMVCS/views/home/widgets/sub_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  final _nameInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var model = context.select<AppModel, AppModel>((e) => e);
    _nameInputController.text = model.currentUser;
    _nameInputController.selection = TextSelection.fromPosition(
        TextPosition(offset: _nameInputController.text.length));

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: FocusScope.of(context).unfocus,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigTitle(title: 'Settings'),
            const Seperator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Name'),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 100),
                    child: CupertinoTextField(
                      maxLines: 1,
                      controller: _nameInputController,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Wakeup'),
                CupertinoButton(
                  child: Text('Değer 2'),
                  onPressed: null,
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sleep'),
                CupertinoButton(
                  child: Text('Değer 3'),
                  onPressed: null,
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Target'),
                CupertinoButton(
                  child: Text('Değer 3'),
                  onPressed: null,
                ),
              ],
            ),
            Divider(),
            Seperator(),
            SubTitle(title: 'Unit'),
            Seperator(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('ML'),
                CupertinoButton(
                  child: Text('Değer 3'),
                  onPressed: null,
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('OZ'),
                CupertinoButton(
                  child: Text('Değer 3'),
                  onPressed: null,
                ),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
