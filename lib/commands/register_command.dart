import 'package:StateManagementMVCS/commands/base_command.dart';

class RegisterCommand extends BaseCommand {
  Future<void> saveUsername(String name) async {
    appModel.currentUser = name;
  }
}
