import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/models/hour_minute_model.dart';
import 'package:StateManagementMVCS/services/app_service.dart';
import 'package:StateManagementMVCS/views/onboarding/widgets/NextPreviousButton.dart';
import 'package:StateManagementMVCS/views/onboarding/widgets/onboardingPageContainer.dart';
import 'package:flutter/cupertino.dart';

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
  HourMinute wakeupTime = HourMinute(8, 0);
  Duration _duration = Duration(hours: 8, minutes: 0); // Default

  @override
  void initState() {
    var _wakeupTimeFromStorage = AppService().getWakingUp();
    if (_wakeupTimeFromStorage != null) {
      setState(() {
        wakeupTime = _wakeupTimeFromStorage;
        _duration =
            Duration(hours: wakeupTime.hour, minutes: wakeupTime.minute);
      });
    }
    super.initState();
  }

  void _handleTimePicker(Duration duration) {
    setState(() {
      wakeupTime = HourMinute(duration.inHours, duration.inMinutes % 60);
    });
  }

  void _handleSaveButton() async {
    await AppCommand().setWakingUp(wakeupTime);
    widget.onNextPressed();
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingPageContainer(
      body: [
        Text(
          'Select Waking Up Time',
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
