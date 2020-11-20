import 'package:StateManagementMVCS/commands/base_command.dart';

class NotificationCommand extends BaseCommand {
  Future<bool> getAndSetPermission() async {
    var status = await notifyService.getPermissionStatus();
    await appService.saveNotification(status);
    return status;
  }

  Future<bool> requestPermission() async {
    return await notifyService.requestPermission();
  }
}
