import 'package:StateManagementMVCS/commands/notification_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/views/home/widgets/switch_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsNotificationSwitch extends StatelessWidget {
  void _changeHandler(bool notify) async {
    if (notify) {
      await NotificationCommand().requestPermission();
    } else {
      await NotificationCommand().removePermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    var notify = context.select<AppModel, bool>((c) => c.notification);

    return SwitchWidget(
      data: notify,
      label: 'notification'.tr(),
      onChangeHandler: _changeHandler,
    );
  }
}
