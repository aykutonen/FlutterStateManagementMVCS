import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/commands/settings_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/views/home/widgets/double_input_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SettingsWeightInput extends StatefulWidget {
  @override
  _SettingsWeightInputState createState() => _SettingsWeightInputState();
}

class _SettingsWeightInputState extends State<SettingsWeightInput> {
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
      SettingsCommand().setError("Ağırlık zorunlu");
      _focusNode.requestFocus();
    } else {
      var weight = double.tryParse(_inputController.text.replaceAll(',', '.'));
      if (weight == null || weight == 0) {
        SettingsCommand().setError("Geçersiz bir mikrar girildi");
        _focusNode.requestFocus();
      } else {
        await AppCommand().setWeight(weight);
        SettingsCommand().setError("");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var weight = context.select<AppModel, double>((c) => c.weightDouble);
    _inputController.text = weight.toString();
    _inputController.selection = TextSelection.fromPosition(
        TextPosition(offset: _inputController.text.length));

    return DoubleInputwidget(
      focusNode: _focusNode,
      infoLabel: 'Kg',
      inputController: _inputController,
      label: 'Weight',
      saveHandle: _handleSaveButton,
    );
  }
}
