import 'package:StateManagementMVCS/constants.dart';
import 'package:flutter/cupertino.dart';

class TextInputWidget extends StatelessWidget {
  final String label;
  final TextEditingController inputController;
  final FocusNode focusNode;

  const TextInputWidget({
    this.label,
    this.inputController,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => focusNode.requestFocus(),
      child: Container(
        height: settingsRowHeight,
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
