import 'package:StateManagementMVCS/constants.dart';
import 'package:flutter/cupertino.dart';

class SelectInputWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final bool isSelected;

  const SelectInputWidget({
    this.onTap,
    this.label,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: settingsRowHeight,
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
