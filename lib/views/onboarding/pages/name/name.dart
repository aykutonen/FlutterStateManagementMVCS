import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/views/onboarding/widgets/nextPreviousButton.dart';
import 'package:StateManagementMVCS/views/onboarding/widgets/onboardingPageContainer.dart';
import 'package:StateManagementMVCS/views/onboarding/widgets/showErrorWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class OnboardingNamePage extends StatefulWidget {
  final VoidCallback onNextPressed;

  const OnboardingNamePage({@required this.onNextPressed});

  @override
  _OnboardingNamePageState createState() => _OnboardingNamePageState();
}

class _OnboardingNamePageState extends State<OnboardingNamePage> {
  final TextEditingController _inputController = TextEditingController();
  String _error = "";

  void _handleSaveButton() async {
    if (_inputController.value.text.isEmpty) {
      setState(() => _error = "İsim zorunlu");
    } else {
      setState(() => _error = "");
      await AppCommand().saveUsername(_inputController.value.text);
      widget.onNextPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    _inputController.text =
        context.select<AppModel, String>((e) => e.currentUser);

    return OnboardingPageContainer(
      body: [
        CupertinoTextField(
          controller: _inputController,
          // textInputAction: TextInputAction.,
          onSubmitted: (_) => _handleSaveButton(),
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
        ShowErrorWidget(errorText: _error),
      ],
      footer: NextPreviousButton(
        showPreviousButton: false,
        onNextPressed: _handleSaveButton,
      ),
    );
  }
}
