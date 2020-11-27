import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/commands/settings_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';
import 'package:StateManagementMVCS/views/home/widgets/number_input_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SettingsTargetInput extends StatefulWidget {
  @override
  _SettingsTargetInputState createState() => _SettingsTargetInputState();
}

class _SettingsTargetInputState extends State<SettingsTargetInput> {
  final _inputController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(_handleSaveButton);

    super.initState();
  }

  void _handleSaveButton() async {
    if (_focusNode.hasFocus) return;

    if (_inputController.text.isEmpty) {
      SettingsCommand().setError("Target zorunlu");
      _focusNode.requestFocus();
    } else {
      SettingsCommand().setError("");

      var amount = int.tryParse(_inputController.text);
      if (amount == null || amount == 0) {
        SettingsCommand().setError("Geçersiz bir miktar girildi");
        _focusNode.requestFocus();
      } else {
        await AppCommand().setTargetAmount(amount);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var target = context.select<AppModel, int>((c) => c.targetAmount);
    var unit = context.select<AppModel, Unit>((c) => c.unit);
    _inputController.text = target.toString();
    _inputController.selection = TextSelection.fromPosition(
        TextPosition(offset: _inputController.text.length));

    return NumberInputWidget(
      focusNode: _focusNode,
      infoLabel: unit.name,
      inputController: _inputController,
      label: 'Target',
      saveHandle: _handleSaveButton,
    );
  }
}
