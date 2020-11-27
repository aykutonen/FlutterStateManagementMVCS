import 'package:StateManagementMVCS/constants.dart';
import 'package:flutter/cupertino.dart';

typedef SwitchCallback = void Function(bool data);

class SwitchWidget extends StatelessWidget {
  final String label;
  final SwitchCallback onChangeHandler;
  final bool data;

  const SwitchWidget({
    this.label,
    this.onChangeHandler,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: settingsRowHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: CupertinoColors.systemGrey),
          ),
          CupertinoSwitch(
            value: data,
            onChanged: onChangeHandler,
          ),
        ],
      ),
    );
  }
}
