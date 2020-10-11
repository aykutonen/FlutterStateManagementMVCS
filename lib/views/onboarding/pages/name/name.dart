import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class OnboardingNamePage extends StatefulWidget {
  final VoidCallback onPressed;

  const OnboardingNamePage({this.onPressed});

  @override
  _OnboardingNamePageState createState() => _OnboardingNamePageState();
}

class _OnboardingNamePageState extends State<OnboardingNamePage> {
  final _inputController = TextEditingController();
  String _error = "";

  void _handleSaveButton() async {
    if (_inputController.value.text.isEmpty) {
      setState(() => _error = "İsim zorunlu");
    } else {
      setState(() => _error = "");
      await AppCommand().saveUsername(_inputController.value.text);
      widget.onPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    _inputController.text =
        context.select<AppModel, String>((e) => e.currentUser);

    return Container(
      child: Center(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoTextField(
                  controller: _inputController,
                  textCapitalization: TextCapitalization.sentences,
                  autofocus: true,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                  placeholder: 'Your Name',
                  placeholderStyle: TextStyle(
                    fontSize: 30,
                    color: CupertinoColors.lightBackgroundGray,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: CupertinoColors.lightBackgroundGray,
                      ),
                    ),
                  ),
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
