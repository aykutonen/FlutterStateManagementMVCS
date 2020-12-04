import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/commands/settings_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/models/gender_model.dart';
import 'package:StateManagementMVCS/views/home/widgets/select_input_widget.dart';
import 'package:StateManagementMVCS/views/home/widgets/seperator.dart';
import 'package:StateManagementMVCS/views/home/widgets/sub_title.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsGenderSelect extends StatelessWidget {
  void _handleSelect(Gender gender) async {
    await AppCommand().setGender(gender);
    SettingsCommand().setError("");
  }

  @override
  Widget build(BuildContext context) {
    var gender = context.select<AppModel, Gender>((c) => c.gender);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubTitle(title: 'gender'.tr()),
        const Seperator(height: 10.0),
        SelectInputWidget(
          isSelected: gender == Gender.m,
          label: Gender.m.name.tr(),
          onTap: () => _handleSelect(Gender.m),
        ),
        const Divider(),
        SelectInputWidget(
          isSelected: gender == Gender.f,
          label: Gender.f.name.tr(),
          onTap: () => _handleSelect(Gender.f),
        ),
      ],
    );
  }
}
