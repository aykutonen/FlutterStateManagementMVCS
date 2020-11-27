import 'package:flutter/cupertino.dart';

typedef SwitchCallback = void Function(bool data);

class SettingsSwitch extends StatelessWidget {
  final String label;
  final SwitchCallback onChangeHandler;
  final double height;
  final bool data;

  const SettingsSwitch({
    this.label,
    this.onChangeHandler,
    this.height,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          CupertinoSwitch(
            value: data,
            onChanged: onChangeHandler,
          ),
        ],
      ),
    );
  }
}
