import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';
import 'package:StateManagementMVCS/views/onboarding/widgets/NextPreviousButton.dart';
import 'package:StateManagementMVCS/views/onboarding/widgets/showErrorWidget.dart';
import 'package:StateManagementMVCS/views/onboarding/widgets/onboardingPageContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class OnboardingTargetAmountPage extends StatefulWidget {
  final VoidCallback onNextPressed;
  final VoidCallback onPreviousPressed;

  const OnboardingTargetAmountPage({
    @required this.onNextPressed,
    @required this.onPreviousPressed,
  });

  @override
  _OnboardingTargetAmountPageState createState() =>
      _OnboardingTargetAmountPageState();
}

class _OnboardingTargetAmountPageState
    extends State<OnboardingTargetAmountPage> {
  final _inputController = TextEditingController();
  String _error = "";
  Unit _selectedUnit;

  void _handleSaveButton() async {
    if (_inputController.value.text.isEmpty) {
      setState(() => _error = "Hedef tüketim miktarı zorunlu.");
    } else {
      setState(() => _error = "");
      await AppCommand()
          .setTargetAmount((int.parse(_inputController.value.text)));
      await AppCommand().saveIsFirstTime(false);
      widget.onNextPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    _selectedUnit = context.select<AppModel, Unit>((e) => e.unit);
    _inputController.text =
        context.select<AppModel, int>((e) => e.targetAmount)?.toString() ?? "";

    return OnboardingPageContainer(
      body: [
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
        ShowErrorWidget(errorText: _error),
      ],
      footer: NextPreviousButton(
        onNextPressed: _handleSaveButton,
        onPrevioustPressed: widget.onPreviousPressed,
      ),
    );
  }
}
