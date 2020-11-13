import 'package:StateManagementMVCS/utils/router/router_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterSaveButton extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  const RegisterSaveButton(this.formKey);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton(
        child: Text('Save'),
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            Navigator.pushNamed(context, RegisterResultPageRoute);
          }

          // TODO: Validation yap.
          // TODO: Hedef tüketim miktarını hesapla
          // TODO: Sonuç sayfasına yönlendir.

          debugPrint(formKey.currentState.value.toString());
        },
        color: CupertinoColors.activeGreen,
      ),
    );
  }
}
