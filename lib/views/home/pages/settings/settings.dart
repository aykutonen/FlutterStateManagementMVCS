import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/views/home/pages/settings/widgets/show_time_pickert_dialog.dart';
import 'package:StateManagementMVCS/views/home/widgets/big_title.dart';
import 'package:StateManagementMVCS/views/home/widgets/seperator.dart';
import 'package:StateManagementMVCS/views/home/widgets/sub_title.dart';
import 'package:StateManagementMVCS/models/hour_minute_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _nameInputController = TextEditingController();
  final _targetInputController = TextEditingController();
  final _targetFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();
  final double _rowHeight = 50.0;

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
    _targetFocusNode.addListener(_handleTargetSaveButton);
    _nameFocusNode.addListener(_handleNameFocusChange);

    super.initState();
  }

  void _handleNameFocusChange() async {
    if (_nameFocusNode.hasFocus) return;

    if (_nameInputController.text.isEmpty) {
      setState(() => _error = "İsim zorunlu");
      _nameFocusNode.requestFocus();
    } else {
      setState(() => _error = "");
      await AppCommand().saveUsername(_nameInputController.text);
    }
  }

  void _handleTargetSaveButton() async {
    if (_targetFocusNode.hasFocus) return;

    if (_targetInputController.text.isEmpty) {
      setState(() => _error = "Target zorunlu");
      _targetFocusNode.requestFocus();
    } else {
      setState(() => _error = "");

      var amount = int.tryParse(_targetInputController.text);
      if (amount == null || amount == 0) {
        setState(() => _error = "Geçerisz bir miktar girildi.");
        _targetFocusNode.requestFocus();
      } else {
        await AppCommand().setTargetAmount(amount);
      }
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

  void _handleUnitSet(Unit unit) async {
    await AppCommand().setUnit(unit);
    setState(() => _error = "");
  }

  @override
  Widget build(BuildContext context) {
    var model = context.select<AppModel, AppModel>((e) => e);

    _nameInputController.text = model.currentUser;
    _nameInputController.selection = TextSelection.fromPosition(
        TextPosition(offset: _nameInputController.text.length));

    _targetInputController.text = model.targetAmount.toString();
    _targetInputController.selection = TextSelection.fromPosition(
        TextPosition(offset: _targetInputController.text.length));

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: FocusScope.of(context).unfocus,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BigTitle(title: 'Settings'),
            const Seperator(height: 25.0),
            Text(_error),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _nameFocusNode.requestFocus(),
              child: Container(
                height: _rowHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Name'),
                    Expanded(
                      child: CupertinoTextField(
                        maxLines: 1,
                        decoration: BoxDecoration(
                            border: Border.all(style: BorderStyle.none)),
                        textCapitalization: TextCapitalization.sentences,
                        controller: _nameInputController,
                        textAlign: TextAlign.right,
                        textInputAction: TextInputAction.done,
                        focusNode: _nameFocusNode,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => ShowTimePickerDialog(
                cancel: () =>
                    Navigator.of(context, rootNavigator: true).pop("Discard"),
                context: context,
                initialDuration: _wakeup,
                pickerChangeHandle: _handleWakeupPicker,
                save: _handleWakeupSave,
                title: 'Select Wakeup Time',
              ).showDialog(),
              child: Container(
                height: _rowHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Wakeup'),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text(model.wakingUp.toDisplayString),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => ShowTimePickerDialog(
                cancel: () =>
                    Navigator.of(context, rootNavigator: true).pop("Discard"),
                context: context,
                initialDuration: _sleep,
                pickerChangeHandle: _handleSleepPicker,
                save: _handleSleepSave,
                title: 'Select Sleeping Time',
              ).showDialog(),
              child: Container(
                height: _rowHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Sleep'),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text(model.sleeping.toDisplayString),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _targetFocusNode.requestFocus(),
              child: Container(
                height: _rowHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Target'),
                    Expanded(
                      child: CupertinoTextField(
                        maxLines: 1,
                        decoration: BoxDecoration(
                            border: Border.all(style: BorderStyle.none)),
                        controller: _targetInputController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textAlign: TextAlign.right,
                        onEditingComplete: _handleTargetSaveButton,
                        textInputAction: TextInputAction.done,
                        focusNode: _targetFocusNode,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text(model.unit.name),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Seperator(),
            SubTitle(title: 'Unit'),
            Seperator(height: 10.0),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _handleUnitSet(Unit.ml),
              child: Container(
                height: _rowHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(Unit.ml.name.toUpperCase()),
                    if (model.unit == Unit.ml)
                      Icon(
                        CupertinoIcons.check_mark,
                        size: 45.0,
                      )
                  ],
                ),
              ),
            ),
            Divider(),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _handleUnitSet(Unit.oz),
              child: Container(
                height: _rowHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(Unit.oz.name.toUpperCase()),
                    if (model.unit == Unit.oz)
                      Icon(
                        CupertinoIcons.check_mark,
                        size: 45.0,
                      ),
                  ],
                ),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
