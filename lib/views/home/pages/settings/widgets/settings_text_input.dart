import 'package:flutter/cupertino.dart';

class SettingsTextInput extends StatelessWidget {
  final String label;
  final VoidCallback onTapHandler;
  final double height;
  final TextEditingController inputController;
  final FocusNode focusNode;

  const SettingsTextInput({
    @required this.label,
    @required this.onTapHandler,
    @required this.height,
    @required this.inputController,
    @required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTapHandler,
      child: Container(
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(color: CupertinoColors.systemGrey),
            ),
            Expanded(
              child: CupertinoTextField(
                maxLines: 1,
                decoration:
                    BoxDecoration(border: Border.all(style: BorderStyle.none)),
                textCapitalization: TextCapitalization.sentences,
                controller: inputController,
                textAlign: TextAlign.right,
                textInputAction: TextInputAction.done,
                focusNode: focusNode,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
