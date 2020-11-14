import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class SettingsDoubleInput extends StatelessWidget {
  final String label;
  final VoidCallback onTapHandler;
  final double height;
  final TextEditingController inputController;
  final FocusNode focusNode;
  final VoidCallback saveHandle;
  final String infoLabel;

  const SettingsDoubleInput({
    @required this.label,
    @required this.infoLabel,
    @required this.onTapHandler,
    @required this.saveHandle,
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
                keyboardType: TextInputType.numberWithOptions(
                  signed: false,
                  decimal: true,
                ),
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
