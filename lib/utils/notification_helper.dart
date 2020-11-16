import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationHelper {
  static FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  static InitializationSettings _initializationSettings;
  static IOSNotificationDetails _iosNotificationDetails;
  static NotificationDetails _notificationDetails;

  static Future<void> init() async {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // if (Platform.isIOS) {
    //   flutterLocalNotificationsPlugin
    //       .resolvePlatformSpecificImplementation<
    //           IOSFlutterLocalNotificationsPlugin>()
    //       .requestPermissions(alert: true, badge: true, sound: true);
    // }

    // App start'da yetki istenmeyecek, daha sonra yapılacaksa bu değişiklik,
    // initialize anında false olarak ayarlanacak yetki talepleri
    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings(
            // requestAlertPermission: false,
            // requestBadgePermission: false,
            // requestSoundPermission: false,
            );

    _initializationSettings =
        InitializationSettings(iOS: iosInitializationSettings);

    _iosNotificationDetails = IOSNotificationDetails();
    _notificationDetails = NotificationDetails(iOS: _iosNotificationDetails);

    // tz.initializeTimeZones();

    // bildirime tıklandığında tetiklenecek fonksiyon ataması.
    // Bunu daha sonra dışarıdan çağrılacak şekilde yap, main'de vs tanımla global bir fonksyion çalışsın...
    // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
    //     onSelectNotification: (payload) async => debugPrint(payload));
  }

  static assignOnClick(Function onNotificationClick) async {
    await _flutterLocalNotificationsPlugin.initialize(_initializationSettings,
        onSelectNotification: (String payload) => onNotificationClick(payload));
  }

  static Future<void> showNotification() async {
    await _flutterLocalNotificationsPlugin.show(
      0,
      'title',
      'body',
      _notificationDetails,
      payload: 'payload',
    );
  }

  static Future<void> repeatNotification() async {
    await _flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      'repeat title',
      'body',
      RepeatInterval.everyMinute,
      _notificationDetails,
      payload: 'payload',
    );
  }

  static Future<void> schedule(DateTime dateTime) async {
    // var dt = tz.TZDateTime.utc(2020, 11, 16, 2, 55, 0, 0, 0);
    var tzDt = tz.TZDateTime.from(dateTime, tz.UTC);
    // tz.TZDateTime.now(tz.local).add(Duration(seconds: 10)),
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      Random().nextInt(1000),
      'title $tzDt',
      'body',
      tzDt,
      _notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: null,
      payload: 'payload',
    );
  }

  static Future<int> getPendingNotificationCount() async {
    List<PendingNotificationRequest> list =
        await _flutterLocalNotificationsPlugin.pendingNotificationRequests();
    return list.length;
  }

  static Future<void> cancelAllNotification() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}
