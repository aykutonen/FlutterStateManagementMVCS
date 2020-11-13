import 'package:StateManagementMVCS/models/hour_minute_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterSleepSelect extends StatelessWidget {
  void _changeTimeHandler(Duration data, FormFieldState<dynamic> field) {
    field.didChange(HourMinute(data.inHours, data.inMinutes % 60).toJson());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height /
        (MediaQuery.of(context).orientation == Orientation.portrait ? 3.5 : 2);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Sleep Time'),
        FormBuilderCustomField(
            attribute: 'sleep',
            formField: FormField(
              builder: (field) {
                return CupertinoButton(
                  child: Text('When you sleeping?'),
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
                            initialTimerDuration:
                                Duration(hours: 0, minutes: 0),
                            onTimerDurationChanged: (tm) =>
                                _changeTimeHandler(tm, field),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            )),
      ],
    );
  }
}
