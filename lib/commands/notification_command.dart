import 'package:StateManagementMVCS/commands/base_command.dart';

class NotificationCommand extends BaseCommand {
  Future<bool> getAndSetPermission() async {
    var status = await notifyService.getPermissionStatus();
    await notifyService.savePermissionToLocal(status);
    appModel.notification = status;
    return status;
  }

  Future<bool> requestPermission() async {
    return await notifyService.requestPermission();
  }

  bool getPermissionFromLocal() {
    return notifyService.getPermissionFromLocal();
  }
}
