import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/models/hour_minute_model.dart';
import 'package:StateManagementMVCS/views/home/widgets/time_input_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

typedef changeHandleCallBack = void Function(Duration duration);

class SettingsWakeupInput extends StatefulWidget {
  @override
  _SettingsWakeupInputState createState() => _SettingsWakeupInputState();
}

class _SettingsWakeupInputState extends State<SettingsWakeupInput> {
  Duration _wakeup;

  @override
  void initState() {
    var wakeup = context.read<AppModel>().wakingUp;
    _wakeup = Duration(hours: wakeup.hour, minutes: wakeup.minute);

    super.initState();
  }

  void _handlePicker(Duration duration) {
    setState(() => _wakeup = duration);
  }

  void _handleSave() async {
    await AppCommand()
        .setWakingUp(HourMinute(_wakeup.inHours, _wakeup.inMinutes % 60));
    Navigator.of(context, rootNavigator: true).pop("save");
  }

  @override
  Widget build(BuildContext context) {
    var wakeup = context.select<AppModel, HourMinute>((c) => c.wakingUp);

    return TimeInputWidget(
      label: 'wakeup'.tr(),
      changeHandle: _handlePicker,
      date: wakeup.toDisplayString,
      initialDuration: _wakeup,
      saveHandle: _handleSave,
      title: 'select_wakeup_time'.tr(),
    );
  }
}
