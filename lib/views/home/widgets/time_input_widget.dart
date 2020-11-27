import 'package:StateManagementMVCS/constants.dart';
import 'package:StateManagementMVCS/views/home/widgets/show_time_pickert_dialog.dart';
import 'package:flutter/cupertino.dart';

typedef changeHandleCallBack = void Function(Duration duration);

class TimeInputWidget extends StatelessWidget {
  final Duration initialDuration;
  final changeHandleCallBack changeHandle;
  final VoidCallback saveHandle;
  final String title;
  final String label;
  final String date;

  const TimeInputWidget({
    this.initialDuration,
    this.changeHandle,
    this.saveHandle,
    this.title,
    this.label,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => ShowTimePickerDialog(
        cancel: () => Navigator.of(context, rootNavigator: true).pop("Discard"),
        context: context,
        initialDuration: initialDuration,
        pickerChangeHandle: changeHandle,
        save: saveHandle,
        title: title,
      ).showDialog(),
      child: Container(
        height: settingsRowHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(color: CupertinoColors.systemGrey),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Text(date),
            ),
          ],
        ),
      ),
    );
  }
}
