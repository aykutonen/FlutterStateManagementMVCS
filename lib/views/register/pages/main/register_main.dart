import 'package:StateManagementMVCS/models/view_model/register_form_model.dart';
import 'package:StateManagementMVCS/views/home/widgets/big_title.dart';
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

class RegisterMain extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  final RegisterFormModel model = RegisterFormModel();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _weightFocusNode = FocusNode();
  static const double spaceSize = 35.0;

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
            const BigTitle(title: 'Report'),
            const Seperator(),
            RegisterName(inputFocus: _nameFocusNode),
            const Divider(height: spaceSize),
            RegisterGenderSelect(),
            const Divider(height: spaceSize),
            RegisterWeight(inputFocus: _weightFocusNode),
            const Divider(height: spaceSize),
            RegisterUnitSelect(),
            const Divider(height: spaceSize),
            RegisterWakeupSelect(),
            const Divider(height: spaceSize),
            RegisterSleepSelect(),
            const Seperator(height: 75.0),
            RegisterSaveButton(_formKey),
          ],
        ),
      ),
    );
  }
}
