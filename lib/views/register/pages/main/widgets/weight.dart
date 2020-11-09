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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: const Text('Weight (kg)'),
          ),
          Flexible(
            flex: 5,
            child: FormBuilderCustomField(
              attribute: 'weight',
              formField: FormField(
                builder: (field) {
                  return CupertinoTextField(
                    // controller: _inputController,
                    focusNode: inputFocus,
                    placeholder: 'Your kilos',
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.numberWithOptions(
                      signed: false,
                      decimal: true,
                    ),
                    onChanged: (v) {
                      if (v.isEmpty)
                        field.didChange(null);
                      else {
                        field.didChange(v);
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
