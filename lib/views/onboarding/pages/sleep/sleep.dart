import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/services/app_service.dart';
import 'package:StateManagementMVCS/views/onboarding/widgets/NextPreviousButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingSleepPage extends StatefulWidget {
  final VoidCallback onNextPressed;
  final VoidCallback onPreviousPressed;

  const OnboardingSleepPage({
    @required this.onNextPressed,
    @required this.onPreviousPressed,
  });

  @override
  _OnboardingSleepPageState createState() => _OnboardingSleepPageState();
}

class _OnboardingSleepPageState extends State<OnboardingSleepPage> {
  String _error = "";
  TimeOfDay sleepTime = TimeOfDay(hour: 23, minute: 1380);
  Duration _duration = Duration(hours: 23, minutes: 0); // Default

  @override
  void initState() {
    var _sleepTimeFromStorage = AppService().getSleeping();
    if (_sleepTimeFromStorage != null) {
      setState(() {
        sleepTime = _sleepTimeFromStorage;
        _duration =
            Duration(hours: sleepTime.hour, minutes: sleepTime.minute % 60);
      });
    }
    super.initState();
  }

  void _handleTimePicker(Duration duration) {
    setState(() {
      sleepTime = TimeOfDay(hour: duration.inHours, minute: duration.inMinutes);
    });
  }

  void _handleSaveButton() async {
    await AppCommand().setSleeping(sleepTime);
    widget.onNextPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select Sleeping Time',
                  style: TextStyle(fontSize: 30),
                ),
                CupertinoTimerPicker(
                  onTimerDurationChanged: (e) => _handleTimePicker(e),
                  mode: CupertinoTimerPickerMode.hm,
                  initialTimerDuration:
                      _duration, //Duration(hours: 23, minutes: 0),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 20),
                  child: Text(
                    _error,
                    style: TextStyle(
                      color: CupertinoColors.destructiveRed,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        NextPreviousButton(
          onNextPressed: _handleSaveButton,
          onPrevioustPressed: widget.onPreviousPressed,
        ),
      ],
    );
  }
}
