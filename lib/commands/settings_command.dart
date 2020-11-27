import 'package:StateManagementMVCS/commands/base_command.dart';

class SettingsCommand extends BaseCommand {
  void setError(String error) {
    settingsModel.error = error;
  }
}
