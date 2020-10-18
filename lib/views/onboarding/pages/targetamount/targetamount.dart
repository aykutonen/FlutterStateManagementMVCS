import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class OnboardingTargetAmountPage extends StatefulWidget {
  final VoidCallback onPressed;

  const OnboardingTargetAmountPage({@required this.onPressed});

  @override
  _OnboardingTargetAmountPageState createState() =>
      _OnboardingTargetAmountPageState();
}

class _OnboardingTargetAmountPageState
    extends State<OnboardingTargetAmountPage> {
  final _inputController = TextEditingController();
  String _error = "";
  Unit _selectedUnit;

  // @override
  // void initState() {
  //   setState(() {
  //     _selectedUnit = context.read<AppModel>().unit;
  //     _inputController.text =
  //         context.read<AppModel>().targetAmount?.toString() ?? "";
  //   });
  //   super.initState();
  // }

  void _handleSaveButton() async {
    if (_inputController.value.text.isEmpty) {
      setState(() => _error = "Hedef tüketim miktarı zorunlu.");
    } else {
      setState(() => _error = "");
      await AppCommand()
          .setTargetAmount((int.parse(_inputController.value.text)));
      await AppCommand().saveIsFirstTime(false);
      widget.onPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    _selectedUnit = context.select<AppModel, Unit>((e) => e.unit);
    _inputController.text =
        context.select<AppModel, int>((e) => e.targetAmount)?.toString() ?? "";

    return Container(
      child: Center(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'How much "${_selectedUnit.name.toUpperCase()}" drink water in a day?'),
                CupertinoTextField(
                  controller: _inputController,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  autofocus: true,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                  placeholder: 'Target Amount',
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

// class OnboardingTargetAmountPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Text('Onboarding Daily Target Amount Page'),
//       ),
//     );
//   }
// }
