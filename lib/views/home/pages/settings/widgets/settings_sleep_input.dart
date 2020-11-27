import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/models/hour_minute_model.dart';
import 'package:StateManagementMVCS/views/home/widgets/time_input_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

typedef changeHandleCallBack = void Function(Duration duration);

class SettingsSleepInput extends StatefulWidget {
  @override
  _SettingsSleepInputState createState() => _SettingsSleepInputState();
}

class _SettingsSleepInputState extends State<SettingsSleepInput> {
  Duration _sleep;

  @override
  void initState() {
    var sleep = context.read<AppModel>().sleeping;
    _sleep = Duration(hours: sleep.hour, minutes: sleep.minute);

    super.initState();
  }

  void _handlePicker(Duration duration) {
    setState(() => _sleep = duration);
  }

  void _handleSave() async {
    await AppCommand()
        .setSleeping(HourMinute(_sleep.inHours, _sleep.inMinutes % 60));
    Navigator.of(context, rootNavigator: true).pop("save");
  }

  @override
  Widget build(BuildContext context) {
    var sleep = context.select<AppModel, HourMinute>((c) => c.sleeping);

    return TimeInputWidget(
      label: 'Sleep',
      changeHandle: _handlePicker,
      date: sleep.toDisplayString,
      initialDuration: _sleep,
      saveHandle: _handleSave,
      title: 'Select Sleeping Time',
    );
  }
}
