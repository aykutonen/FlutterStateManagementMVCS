import 'package:flutter/cupertino.dart';

typedef PickerChangeCallback = void Function(Duration duration);

class ShowTimePickerDialog {
  final BuildContext context;
  final String title;
  final VoidCallback save;
  final VoidCallback cancel;
  final PickerChangeCallback pickerChangeHandle;
  final Duration initialDuration;

  const ShowTimePickerDialog({
    @required this.context,
    @required this.title,
    @required this.save,
    @required this.cancel,
    @required this.pickerChangeHandle,
    @required this.initialDuration,
  });

  void showDialog() {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          actions: [
            CupertinoDialogAction(
              child: Text('Vazgeç'),
              onPressed: cancel,
            ),
            CupertinoDialogAction(
              child: Text('Kaydet'),
              isDefaultAction: true,
              onPressed: save,
            ),
          ],
          content: CupertinoTimerPicker(
            onTimerDurationChanged: pickerChangeHandle,
            mode: CupertinoTimerPickerMode.hm,
            initialTimerDuration: initialDuration,
          ),
        );
      },
    );
  }
}
