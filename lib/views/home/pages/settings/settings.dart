import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/views/home/pages/settings/widgets/settings_number_input.dart';
import 'package:StateManagementMVCS/views/home/pages/settings/widgets/settings_select_input.dart';
import 'package:StateManagementMVCS/views/home/pages/settings/widgets/settings_text_input.dart';
import 'package:StateManagementMVCS/views/home/pages/settings/widgets/settings_time_input.dart';
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
        setState(() => _error = "Geçersiz bir miktar girildi.");
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
            SettingsTextInput(
              label: 'Name',
              height: _rowHeight,
              inputController: _nameInputController,
              focusNode: _nameFocusNode,
              onTapHandler: _nameFocusNode.requestFocus,
            ),
            Divider(),
            SettingsTimeInput(
              changeHandle: _handleWakeupPicker,
              date: model.wakingUp.toDisplayString,
              height: _rowHeight,
              initialDuration: _wakeup,
              label: 'Wakeup',
              saveHandle: _handleWakeupSave,
              title: 'Select Wakeup Time',
            ),
            Divider(),
            SettingsTimeInput(
              changeHandle: _handleSleepPicker,
              date: model.sleeping.toDisplayString,
              height: _rowHeight,
              initialDuration: _sleep,
              label: 'Sleep',
              saveHandle: _handleSleepSave,
              title: 'Select Sleeping Time',
            ),
            Divider(),
            SettingsNumberInput(
              label: 'Target',
              infoLabel: model.unit.name,
              onTapHandler: _targetFocusNode.requestFocus,
              saveHandle: _handleTargetSaveButton,
              height: _rowHeight,
              inputController: _targetInputController,
              focusNode: _targetFocusNode,
            ),
            Divider(),
            Seperator(),
            SubTitle(title: 'Unit'),
            Seperator(height: 10.0),
            SettingsSelectInput(
              onTap: () => _handleUnitSet(Unit.ml),
              height: _rowHeight,
              label: Unit.ml.name.toUpperCase(),
              isSelected: model.unit == Unit.ml,
            ),
            Divider(),
            SettingsSelectInput(
              onTap: () => _handleUnitSet(Unit.oz),
              height: _rowHeight,
              label: Unit.oz.name.toUpperCase(),
              isSelected: model.unit == Unit.oz,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
