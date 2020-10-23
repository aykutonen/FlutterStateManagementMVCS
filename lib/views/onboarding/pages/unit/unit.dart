import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';
import 'package:StateManagementMVCS/services/app_service.dart';
import 'package:StateManagementMVCS/views/onboarding/widgets/NextPreviousButton.dart';
import 'package:StateManagementMVCS/views/onboarding/widgets/onboardingPageContainer.dart';
import 'package:StateManagementMVCS/views/onboarding/widgets/showErrorWidget.dart';
import 'package:flutter/cupertino.dart';

class OnboardingUnitPage extends StatefulWidget {
  final VoidCallback onNextPressed;
  final VoidCallback onPreviousPressed;

  const OnboardingUnitPage({
    @required this.onNextPressed,
    @required this.onPreviousPressed,
  });

  @override
  _OnboardingUnitPageState createState() => _OnboardingUnitPageState();
}

class _OnboardingUnitPageState extends State<OnboardingUnitPage> {
  String _error = "";
  String _selected = "";

  @override
  void initState() {
    var _unitFromStorage = AppService().getUnit();
    if (_unitFromStorage != null) {
      setState(() => _selected = _unitFromStorage.name);
    }
    super.initState();
  }

  void _handleMlButton() async {
    await AppCommand().setUnit(Unit.ml);
    setState(() => _selected = Unit.ml.name);
    widget.onNextPressed();
  }

  void _handleOzButton() async {
    await AppCommand().setUnit(Unit.oz);
    setState(() => _selected = Unit.oz.name);
    widget.onNextPressed();
  }

  void _handleNextOnPressed() {
    if (_selected.isEmpty) {
      setState(() => _error = "Please select a water unit");
    } else {
      setState(() => _error = "");
      widget.onNextPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingPageContainer(
      body: [
        Text(
          'Select Water Unit',
          style: TextStyle(fontSize: 30),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
                child: Text(
                  'ml',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight:
                        _selected == "ml" ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                onPressed: _handleMlButton),
            CupertinoButton(
                child: Text(
                  'oz',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight:
                        _selected == "oz" ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                onPressed: _handleOzButton)
          ],
        ),
        ShowErrorWidget(errorText: _error),
      ],
      footer: NextPreviousButton(
        onNextPressed: _handleNextOnPressed,
        onPrevioustPressed: widget.onPreviousPressed,
      ),
    );
  }
}
