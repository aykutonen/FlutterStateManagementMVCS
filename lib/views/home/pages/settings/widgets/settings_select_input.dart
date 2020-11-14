import 'package:flutter/cupertino.dart';

class SettingsSelectInput extends StatelessWidget {
  final VoidCallback onTap;
  final double height;
  final String label;
  final bool isSelected;

  const SettingsSelectInput({
    @required this.onTap,
    @required this.height,
    @required this.label,
    @required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: !isSelected
                  ? TextStyle(color: CupertinoColors.systemGrey)
                  : null,
            ),
            if (isSelected)
              Icon(
                CupertinoIcons.check_mark,
                size: 45.0,
              )
          ],
        ),
      ),
    );
  }
}
