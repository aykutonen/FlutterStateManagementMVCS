import 'package:StateManagementMVCS/utils/generic_helper.dart';

import 'package:flutter/cupertino.dart';

typedef ChangeDurationCallback = void Function(Duration data);

class ButtonAndTimePickerWidget extends StatelessWidget {
  final Duration duration;
  final ChangeDurationCallback callBack;

  const ButtonAndTimePickerWidget({
    @required this.duration,
    @required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height /
        (MediaQuery.of(context).orientation == Orientation.portrait ? 3.5 : 2);

    return CupertinoButton(
      child: Text(duration.toDisplay),
      onPressed: () {
        showCupertinoModalPopup(
          semanticsDismissible: true,
          context: context,
          builder: (BuildContext builder) {
            return Container(
              color: CupertinoColors.white,
              height: height,
              child: CupertinoTimerPicker(
                mode: CupertinoTimerPickerMode.hm,
                initialTimerDuration: duration,
                onTimerDurationChanged: callBack,
              ),
            );
          },
        );
      },
    );
  }
}
