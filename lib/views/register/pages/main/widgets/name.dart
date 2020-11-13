import 'package:StateManagementMVCS/views/register/pages/main/widgets/error_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterName extends StatelessWidget {
  final FocusNode inputFocus;

  const RegisterName({this.inputFocus});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: inputFocus.requestFocus,
      behavior: HitTestBehavior.opaque,
      child: FormBuilderCustomField(
        attribute: 'name',
        validators: [
          FormBuilderValidators.required(errorText: 'İsim bilgisi gerekli.'),
        ],
        formField: FormField(builder: (field) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: const Text('Name'),
                  ),
                  Flexible(
                    flex: 5,
                    child: CupertinoTextField(
                      focusNode: inputFocus,
                      placeholder: 'Your Name',
                      textAlign: TextAlign.end,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.done,
                      onChanged: (v) => field.didChange(v.isEmpty ? null : v),
                    ),
                  ),
                ],
              ),
              if (field.hasError) ErrorText(text: field.errorText)
            ],
          );
        }),
      ),
    );
  }
}
