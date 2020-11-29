import 'package:StateManagementMVCS/models/notify_model.dart';
import 'package:StateManagementMVCS/utils/base_db_helper.dart';
import 'package:StateManagementMVCS/utils/notification_helper.dart';
import 'package:StateManagementMVCS/utils/shared_preferences_util.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification_permissions/notification_permissions.dart';

class NotificationService {
  /// Yetki iste
  Future<bool> requestPermission() async {
    await NotificationPermissions.requestNotificationPermissions(
        iosSettings: const NotificationSettingsIos(
      alert: true,
      badge: true,
      sound: true,
    ));
    return await getPermissionStatus();
  }

  /// Yetki var mı yok mu kontrol et
  Future<bool> getPermissionStatus() async {
    bool _status = false;
    PermissionStatus status =
        await NotificationPermissions.getNotificationPermissionStatus();

    switch (status) {
      case PermissionStatus.denied:
      case PermissionStatus.unknown:
      case PermissionStatus.provisional:
        _status = false;
        break;
      case PermissionStatus.granted:
        _status = true;
        break;
    }

    return _status;
  }

  /// Yetki durumunu local'de sakla.
  Future<bool> savePermissionToLocal(bool notify) async {
    return await Preferences.setBool("notify", notify);
  }

  /// Localdeki yetki durumunu geri döner
  bool getPermissionFromLocal() {
    return Preferences.getBool("notify", false);
  }

  /// Cihazda bekleyen bildirimlerin db'deki karşılıklarını verir
  Future<List<NotifyModel>> getPendingNotifications() async {
    List<NotifyModel> result = List<NotifyModel>();

    List<PendingNotificationRequest> pending =
        await NotificationHelper().getPendingNotifications();
    if (pending.length > 0) {
      var pendingIds = pending.map((e) => e.id).toList();
      var pendingWhere = List.filled(pendingIds.length, '?').join(',');
      var db = await BaseDbHelper().db;
      var fromDb = await db.query(
        'notify',
        where: 'id IN (' + pendingWhere + ')',
        whereArgs: pendingIds,
        orderBy: 'sendDateUnix DESC',
      );

      if (fromDb.isNotEmpty) {
        result = fromDb.map((e) => NotifyModel.fromMap(e)).toList();
      }
    }

    return result;
  }

  /// Bildirim gönderini db'ye ve service kaydeder.
  Future<NotifyModel> schedule(NotifyModel notify) async {
    var db = await BaseDbHelper().db;
    notify.id = await db.insert('notify', notify.toMap());
    if (notify.id > 0) {
      await NotificationHelper().schedule(notify);
    }
    return notify;
  }
}
