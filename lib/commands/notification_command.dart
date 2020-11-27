import 'package:StateManagementMVCS/commands/base_command.dart';
import 'package:StateManagementMVCS/utils/notification_helper.dart';

class NotificationCommand extends BaseCommand {
  Future<bool> getAndSetPermission() async {
    var status = await notifyService.getPermissionStatus();
    await notifyService.savePermissionToLocal(status);
    appModel.notification = status;
    return status;
  }

  Future<bool> requestPermission() async {
    var status = await notifyService.requestPermission();
    await notifyService.savePermissionToLocal(status);
    appModel.notification = status;
    return status;
  }

  Future<void> removePermission() async {
    await notifyService.savePermissionToLocal(false);
    await NotificationHelper().cancelAllNotification();
    appModel.notification = false;
  }

  bool getPermissionFromLocal() {
    return notifyService.getPermissionFromLocal();
  }

  Future<bool> setPermissionToLocal(bool notify) async {
    return await notifyService.savePermissionToLocal(notify);
  }
}
