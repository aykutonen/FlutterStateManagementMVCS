import 'package:StateManagementMVCS/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class NumberInputWidget extends StatelessWidget {
  final String label;
  final TextEditingController inputController;
  final FocusNode focusNode;
  final VoidCallback saveHandle;
  final String infoLabel;

  const NumberInputWidget({
    this.label,
    this.inputController,
    this.focusNode,
    this.saveHandle,
    this.infoLabel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: focusNode.requestFocus,
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
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                controller: inputController,
                textAlign: TextAlign.right,
                textInputAction: TextInputAction.done,
                onEditingComplete: saveHandle,
                focusNode: focusNode,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Text(infoLabel),
            ),
          ],
        ),
      ),
    );
  }
}
