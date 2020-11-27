import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/commands/settings_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';
import 'package:StateManagementMVCS/views/home/widgets/select_input_widget.dart';
import 'package:StateManagementMVCS/views/home/widgets/seperator.dart';
import 'package:StateManagementMVCS/views/home/widgets/sub_title.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsUnitSelect extends StatelessWidget {
  void _handleSelect(Unit unit) async {
    await AppCommand().setUnit(unit);
    SettingsCommand().setError("");
  }

  @override
  Widget build(BuildContext context) {
    var unit = context.select<AppModel, Unit>((c) => c.unit);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubTitle(title: 'Unit'),
        const Seperator(height: 10.0),
        SelectInputWidget(
          isSelected: unit == Unit.ml,
          label: Unit.ml.name.toUpperCase(),
          onTap: () => _handleSelect(Unit.ml),
        ),
        Divider(),
        SelectInputWidget(
          isSelected: unit == Unit.oz,
          label: Unit.oz.name.toUpperCase(),
          onTap: () => _handleSelect(Unit.oz),
        ),
      ],
    );
  }
}
