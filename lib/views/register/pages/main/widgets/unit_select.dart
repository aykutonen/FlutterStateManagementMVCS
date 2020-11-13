import 'package:StateManagementMVCS/models/unit_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterUnitSelect extends StatelessWidget {
  void selectUnitHandler(Unit unit, FormFieldState<dynamic> field) {
    field.didChange(unit);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Water Unit'),
        Flexible(
          flex: 5,
          child: FormBuilderCustomField(
            attribute: 'waterUnit',
            formField: FormField(
              builder: (field) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      child: Text(Unit.ml.name.toUpperCase()),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        selectUnitHandler(Unit.ml, field);
                      },
                      color: field.value == Unit.ml
                          ? CupertinoColors.activeBlue
                          : CupertinoColors.systemGrey4,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                    ),
                    SizedBox(width: 10),
                    CupertinoButton(
                        child: Text(Unit.oz.name.toUpperCase()),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          selectUnitHandler(Unit.oz, field);
                        },
                        color: field.value == Unit.oz
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
