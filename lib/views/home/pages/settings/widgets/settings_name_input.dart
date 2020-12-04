import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/commands/settings_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/views/home/widgets/text_input_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsNameInput extends StatefulWidget {
  @override
  _SettingsNameInputState createState() => _SettingsNameInputState();
}

class _SettingsNameInputState extends State<SettingsNameInput> {
  final TextEditingController _nameInputController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();

  @override
  void initState() {
    _nameFocusNode.addListener(_handleNameFocusChange);

    super.initState();
  }

  void _handleNameFocusChange() async {
    if (_nameFocusNode.hasFocus) return;

    if (_nameInputController.text.isEmpty) {
      SettingsCommand().setError("name_required".tr());
      _nameFocusNode.requestFocus();
    } else {
      SettingsCommand().setError("");
      await AppCommand().saveUsername(_nameInputController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    var name = context.select<AppModel, String>((c) => c.currentUser);
    _nameInputController.text = name;
    _nameInputController.selection = TextSelection.fromPosition(
        TextPosition(offset: _nameInputController.text.length));

    return TextInputWidget(
      focusNode: _nameFocusNode,
      inputController: _nameInputController,
      label: 'name'.tr(),
    );
  }
}
