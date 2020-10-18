import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/services/app_service.dart';
import 'package:StateManagementMVCS/views/onboarding/widgets/NextPreviousButton.dart';
import 'package:StateManagementMVCS/views/onboarding/widgets/onboardingPageContainer.dart';
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
    return OnboardingPageContainer(
      body: [
        Text(
          'Select Sleeping Time',
          style: TextStyle(fontSize: 30),
        ),
        CupertinoTimerPicker(
          onTimerDurationChanged: (e) => _handleTimePicker(e),
          mode: CupertinoTimerPickerMode.hm,
          initialTimerDuration: _duration, //Duration(hours: 23, minutes: 0),
        ),
      ],
      footer: NextPreviousButton(
        onNextPressed: _handleSaveButton,
        onPrevioustPressed: widget.onPreviousPressed,
      ),
    );
  }
}
