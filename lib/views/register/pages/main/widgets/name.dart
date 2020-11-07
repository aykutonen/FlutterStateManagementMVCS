import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class RegisterName extends StatelessWidget {
  final TextEditingController inputController;
  final inputFocus;

  const RegisterName({this.inputFocus, this.inputController});

  @override
  Widget build(BuildContext context) {
    inputController.text =
        context.select<AppModel, String>((e) => e.currentUser);
    inputController.selection = TextSelection.fromPosition(
        TextPosition(offset: inputController.text.length));

    return GestureDetector(
      onTap: inputFocus.requestFocus,
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: const Text('Name'),
          ),
          Flexible(
            flex: 5,
            child: CupertinoTextField(
              controller: inputController,
              focusNode: inputFocus,
              placeholder: 'Your Name',
              textAlign: TextAlign.end,
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
        ],
      ),
    );
  }
}
