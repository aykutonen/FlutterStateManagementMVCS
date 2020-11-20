import 'package:flutter/material.dart';
import 'package:notification_permissions/notification_permissions.dart';

class NotificationService {
  // Yetki iste

  Future<bool> requestPermission() async {
    await NotificationPermissions.requestNotificationPermissions(
        iosSettings: const NotificationSettingsIos(
      alert: true,
      badge: true,
      sound: true,
    ));
    return await getPermissionStatus();
  }

  // Yetki var mı yok mu kontrol et
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

    debugPrint(_status.toString());
    return _status;
  }
  // Yetki durumunu local'de sakla.
}
