import 'package:StateManagementMVCS/models/settings_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SettingsError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String error = context.select<SettingsModel, String>((c) => c.error);

    return error.isNotEmpty ? Text(error) : Container();
  }
}
