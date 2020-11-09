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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: const Text('Name'),
          ),
          Flexible(
            flex: 5,
            child: FormBuilderCustomField(
              attribute: 'name',
              formField: FormField(
                builder: (field) {
                  return CupertinoTextField(
                    focusNode: inputFocus,
                    placeholder: 'Your Name',
                    textAlign: TextAlign.end,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      if (value.isEmpty)
                        field.didChange(null);
                      else {
                        field.didChange(value);
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
