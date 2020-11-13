import 'package:StateManagementMVCS/views/register/widgets/button_and_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterSleepSelect extends StatelessWidget {
  void _changeTimeHandler(Duration data, FormFieldState<dynamic> field) {
    field.didChange(data);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Sleep Time'),
        FormBuilderCustomField(
            attribute: 'sleep',
            formField: FormField(
              builder: (field) {
                return ButtonAndTimePickerWidget(
                  duration: field.value,
                  callBack: (d) => _changeTimeHandler(d, field),
                );
              },
            )),
      ],
    );
  }
}
