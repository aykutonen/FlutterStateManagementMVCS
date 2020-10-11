import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/services/app_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingWakeUpPage extends StatefulWidget {
  final VoidCallback onPressed;

  const OnboardingWakeUpPage({@required this.onPressed});

  @override
  _OnboardingWakeUpPageState createState() => _OnboardingWakeUpPageState();
}

class _OnboardingWakeUpPageState extends State<OnboardingWakeUpPage> {
  String _error = "";
  TimeOfDay wakeupTime = TimeOfDay(hour: 8, minute: 480);
  Duration _duration = Duration(hours: 8, minutes: 0); // Default

  @override
  void initState() {
    setState(() {
      wakeupTime = AppService().getWakingUp();
      _duration =
          Duration(hours: wakeupTime.hour, minutes: wakeupTime.minute % 60);
    });
    super.initState();
  }

  void _handleTimePicker(Duration duration) {
    setState(() {
      wakeupTime =
          TimeOfDay(hour: duration.inHours, minute: duration.inMinutes);

      _error =
          duration.inHours.toString() + " " + duration.inMinutes.toString();
    });
  }

  void _handleSaveButton() async {
    await AppCommand().setWakingUp(wakeupTime);
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select Waking Up Time',
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
                CupertinoButton(
                  child: Text('Save'),
                  onPressed: _handleSaveButton,
                )
              ],
            )),
      ),
    );
  }
}
