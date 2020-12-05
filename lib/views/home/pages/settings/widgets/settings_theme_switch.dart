import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/views/home/widgets/switch_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsThemeSwitch extends StatelessWidget {
  void _changeHandler(bool isDark) async {
    AppCommand().setTheme(isDark);
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = context.select<AppModel, bool>((c) => c.isDark);
    return SwitchWidget(
      data: isDark,
      label: 'theme_is_dark'.tr(),
      onChangeHandler: _changeHandler,
    );
  }
}
