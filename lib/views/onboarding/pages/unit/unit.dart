import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';
import 'package:StateManagementMVCS/services/app_service.dart';
import 'package:flutter/cupertino.dart';

class OnboardingUnitPage extends StatefulWidget {
  final VoidCallback onPressed;

  const OnboardingUnitPage({@required this.onPressed});

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
    widget.onPressed();
  }

  void _handleOzButton() async {
    await AppCommand().setUnit(Unit.oz);
    setState(() => _selected = Unit.oz.name);
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
                            fontWeight: _selected == "ml"
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        onPressed: _handleMlButton),
                    CupertinoButton(
                        child: Text(
                          'oz',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: _selected == "oz"
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        onPressed: _handleOzButton)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 20),
                  child: Text(
                    _error,
                    style: TextStyle(
                      color: CupertinoColors.destructiveRed,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
