import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/services/app_service.dart';
import 'package:StateManagementMVCS/views/onboarding/widgets/NextPreviousButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingWakeUpPage extends StatefulWidget {
  final VoidCallback onNextPressed;
  final VoidCallback onPreviousPressed;

  const OnboardingWakeUpPage({
    @required this.onNextPressed,
    @required this.onPreviousPressed,
  });

  @override
  _OnboardingWakeUpPageState createState() => _OnboardingWakeUpPageState();
}

class _OnboardingWakeUpPageState extends State<OnboardingWakeUpPage> {
  String _error = "";
  TimeOfDay wakeupTime = TimeOfDay(hour: 8, minute: 480);
  Duration _duration = Duration(hours: 8, minutes: 0); // Default

  @override
  void initState() {
    var _wakeupTimeFromStorage = AppService().getWakingUp();
    if (_wakeupTimeFromStorage != null) {
      setState(() {
        wakeupTime = _wakeupTimeFromStorage;
        _duration =
            Duration(hours: wakeupTime.hour, minutes: wakeupTime.minute % 60);
      });
    }
    super.initState();
  }

  void _handleTimePicker(Duration duration) {
    setState(() {
      wakeupTime =
          TimeOfDay(hour: duration.inHours, minute: duration.inMinutes);
    });
  }

  void _handleSaveButton() async {
    await AppCommand().setWakingUp(wakeupTime);
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
