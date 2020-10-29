import 'package:StateManagementMVCS/views/home/pages/settings/widgets/show_time_pickert_dialog.dart';
import 'package:flutter/cupertino.dart';

typedef changeHandleCallBack = void Function(Duration duration);

class SettingsTimeInput extends StatelessWidget {
  final Duration initialDuration;
  final changeHandleCallBack changeHandle;
  final VoidCallback saveHandle;
  final String title;
  final double height;
  final String label;
  final String date;

  const SettingsTimeInput({
    this.initialDuration,
    this.changeHandle,
    this.saveHandle,
    this.title,
    this.height,
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
        height: height,
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
