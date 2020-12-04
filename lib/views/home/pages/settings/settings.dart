import 'package:StateManagementMVCS/views/home/pages/settings/widgets/settings_error.dart';
import 'package:StateManagementMVCS/views/home/pages/settings/widgets/settings_gender_select.dart';
import 'package:StateManagementMVCS/views/home/pages/settings/widgets/settings_weight_input.dart';
import 'package:StateManagementMVCS/views/home/pages/settings/widgets/settings_target_input.dart';
import 'package:StateManagementMVCS/views/home/pages/settings/widgets/settings_unit_select.dart';
import 'package:StateManagementMVCS/views/home/pages/settings/widgets/settings_sleep_input.dart';
import 'package:StateManagementMVCS/views/home/pages/settings/widgets/settings_notification_switch.dart';
import 'package:StateManagementMVCS/views/home/pages/settings/widgets/settings_name_input.dart';
import 'package:StateManagementMVCS/views/home/pages/settings/widgets/settings_wakeup_input.dart';
import 'package:StateManagementMVCS/views/home/widgets/big_title.dart';
import 'package:StateManagementMVCS/views/home/widgets/seperator.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: FocusScope.of(context).unfocus,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigTitle(title: 'settings'.tr()),
            const Seperator(height: 25.0),
            SettingsError(),
            SettingsNameInput(),
            const Divider(),
            SettingsWakeupInput(),
            const Divider(),
            SettingsSleepInput(),
            const Divider(),
            SettingsWeightInput(),
            const Divider(),
            SettingsTargetInput(),
            const Divider(),
            SettingsNotificationSwitch(),
            const Divider(),
            const Seperator(),
            SettingsUnitSelect(),
            const Divider(),
            const Seperator(),
            SettingsGenderSelect(),
          ],
        ),
      ),
    );
  }
}
