import 'package:StateManagementMVCS/models/view_model/register_model.dart';
import 'package:StateManagementMVCS/views/home/widgets/seperator.dart';
import 'package:StateManagementMVCS/views/register/pages/main/widgets/gender_select.dart';
import 'package:StateManagementMVCS/views/register/pages/main/widgets/name.dart';
import 'package:StateManagementMVCS/views/register/pages/main/widgets/save_button.dart';
import 'package:StateManagementMVCS/views/register/pages/main/widgets/sleep_select.dart';
import 'package:StateManagementMVCS/views/register/pages/main/widgets/unit_select.dart';
import 'package:StateManagementMVCS/views/register/pages/main/widgets/wakeup_select.dart';
import 'package:StateManagementMVCS/views/register/pages/main/widgets/weight.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO: app start'da varsayılan değerleri önceden kaydet. Form kısmen dolu gelsin.
// Cinsiyet; Kadın, Unit ML, Wakeup 8:00, Sleep: 23:00

class RegisterMain extends StatefulWidget {
  @override
  _RegisterMainState createState() => _RegisterMainState();
}

class _RegisterMainState extends State<RegisterMain> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  RegisterModel model = RegisterModel();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _weightFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      initialValue: model.toMap(),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: FocusScope.of(context).unfocus,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RegisterName(inputFocus: _nameFocusNode),
            const Divider(height: 50),
            RegisterGenderSelect(),
            const Divider(height: 50),
            RegisterWeight(inputFocus: _weightFocusNode),
            const Divider(height: 50),
            RegisterUnitSelect(),
            const Divider(height: 50),
            RegisterWakeupSelect(),
            const Divider(height: 50),
            RegisterSleepSelect(),
            const Seperator(height: 50.0),
            RegisterSaveButton(_formKey),
          ],
        ),
      ),
    );
  }
}
