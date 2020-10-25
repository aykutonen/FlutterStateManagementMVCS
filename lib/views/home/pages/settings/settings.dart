import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/views/home/pages/main/widgets/greeting.dart';
import 'package:StateManagementMVCS/views/home/pages/settings/widgets/show_time_pickert_dialog.dart';
import 'package:StateManagementMVCS/views/home/widgets/big_title.dart';
import 'package:StateManagementMVCS/views/home/widgets/seperator.dart';
import 'package:StateManagementMVCS/views/home/widgets/sub_title.dart';
import 'package:StateManagementMVCS/models/hour_minute_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _nameInputController = TextEditingController();
  String _error = "";
  Duration _wakeup;
  Duration _sleep;

  @override
  void initState() {
    var w = context.read<AppModel>().wakingUp;
    var s = context.read<AppModel>().sleeping;

    setState(() {
      _wakeup = Duration(hours: w.hour, minutes: w.minute);
      _sleep = Duration(hours: s.hour, minutes: s.minute);
    });

    super.initState();
  }

  void _handleSaveButton() async {
    if (_nameInputController.text.isEmpty) {
      setState(() => _error = "İsim zorunlu");
    } else {
      setState(() => _error = "");
      await AppCommand().saveUsername(_nameInputController.text);
      FocusScope.of(context).unfocus();
    }
  }

  void _handleSleepPicker(Duration duration) {
    setState(() => _sleep = duration);
  }

  void _handleSleepSave() async {
    await AppCommand()
        .setSleeping(HourMinute(_sleep.inHours, _sleep.inMinutes % 60));
    Navigator.of(context, rootNavigator: true).pop("save");
  }

  void _handleWakeupPicker(Duration duration) {
    setState(() => _wakeup = duration);
  }

  void _handleWakeupSave() async {
    await AppCommand()
        .setWakingUp(HourMinute(_wakeup.inHours, _wakeup.inMinutes % 60));
    Navigator.of(context, rootNavigator: true).pop("save");
  }

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
            Greeting(),
            const Seperator(),
            Text(_error),
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
                      textCapitalization: TextCapitalization.sentences,
                      controller: _nameInputController,
                      textAlign: TextAlign.right,
                      onEditingComplete: _handleSaveButton,
                      textInputAction: TextInputAction.done,
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
                  child: Text(
                    model.wakingUp.toDisplayString,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    ShowTimePickerDialog(
                      cancel: () => Navigator.of(context, rootNavigator: true)
                          .pop("Discard"),
                      context: context,
                      initialDuration: _wakeup,
                      pickerChangeHandle: _handleWakeupPicker,
                      save: _handleWakeupSave,
                      title: 'Select Wakeup Time',
                    ).showDialog();
                  },
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sleep'),
                CupertinoButton(
                    child: Text(
                      model.sleeping.toDisplayString,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      ShowTimePickerDialog(
                        cancel: () => Navigator.of(context, rootNavigator: true)
                            .pop("Discard"),
                        context: context,
                        initialDuration: _sleep,
                        pickerChangeHandle: _handleSleepPicker,
                        save: _handleSleepSave,
                        title: 'Select Sleeping Time',
                      ).showDialog();
                    }),
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
