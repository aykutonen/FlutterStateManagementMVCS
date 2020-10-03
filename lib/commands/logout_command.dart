import './base_command.dart';

class LogOutCommand extends BaseCommand {
  Future<bool> run() async {
    // Await some service call
    bool logoutSuccess = await userService.logout();

// set null if logout is success
    if (logoutSuccess) {
      appModel.currentUser = null;
      userModel.userPosts = null;
    }

    // Return the result to whoever called us, in case they care
    return logoutSuccess;
  }
}
