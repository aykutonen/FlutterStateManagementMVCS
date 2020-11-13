import 'package:StateManagementMVCS/views/register/pages/main/widgets/error_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterWeight extends StatelessWidget {
  final FocusNode inputFocus;

  const RegisterWeight({@required this.inputFocus});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: inputFocus.requestFocus,
      behavior: HitTestBehavior.opaque,
      child: FormBuilderCustomField(
        attribute: 'weight',
        validators: [
          FormBuilderValidators.required(errorText: 'ağırlık bilgisi gerekli.')
        ],
        formField: FormField(
          builder: (field) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: const Text('Weight (kg)'),
                    ),
                    Flexible(
                      flex: 5,
                      child: CupertinoTextField(
                        focusNode: inputFocus,
                        placeholder: 'Your kilos',
                        textAlign: TextAlign.end,
                        keyboardType: TextInputType.numberWithOptions(
                          signed: false,
                          decimal: true,
                        ),
                        onChanged: (v) => field.didChange(v.isEmpty ? null : v),
                      ),
                    ),
                  ],
                ),
                if (field.hasError) ErrorText(text: field.errorText),
              ],
            );
          },
        ),
      ),
    );
  }
}
