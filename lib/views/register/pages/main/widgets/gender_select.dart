import 'package:StateManagementMVCS/models/gender_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterGenderSelect extends StatelessWidget {
  void selectGenderHandler(Gender gender, FormFieldState<dynamic> field) {
    field.didChange(gender);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Gender'),
        Flexible(
          flex: 5,
          child: FormBuilderCustomField(
            attribute: 'gender',
            formField: FormField(
              builder: (field) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      child: Text('Female'),
                      onPressed: () => selectGenderHandler(Gender.f, field),
                      color: field.value == Gender.f
                          ? CupertinoColors.activeBlue
                          : CupertinoColors.systemGrey4,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                    ),
                    SizedBox(width: 10),
                    CupertinoButton(
                        child: Text('Male'),
                        onPressed: () => selectGenderHandler(Gender.m, field),
                        color: field.value == Gender.m
                            ? CupertinoColors.activeBlue
                            : CupertinoColors.systemGrey4,
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 5.0)),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
