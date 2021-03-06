import 'dart:io';

import 'package:StateManagementMVCS/models/notify_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path/path.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class NotificationHelper {
  static FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  static InitializationSettings _initializationSettings;
  IOSNotificationDetails _iosNotificationDetails;
  NotificationDetails _notificationDetails;
  static String filePath;

  Future<void> init() async {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // Manuel notification izin isteği
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
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    _initializationSettings =
        InitializationSettings(iOS: iosInitializationSettings);

    // tz.initializeTimeZones();

    // bildirime tıklandığında tetiklenecek fonksiyon ataması.
    // Bunu daha sonra dışarıdan çağrılacak şekilde yap, main'de vs tanımla global bir fonksyion çalışsın...
    // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
    //     onSelectNotification: (payload) async => debugPrint(payload));
  }

  Future<void> assignOnClick(Function onNotificationClick) async {
    await _flutterLocalNotificationsPlugin.initialize(_initializationSettings,
        onSelectNotification: (String payload) => onNotificationClick(payload));
  }

  Future<void> showNotification() async {
    await _flutterLocalNotificationsPlugin.show(
      0,
      'title',
      'body',
      _notificationDetails,
      payload: 'payload',
    );
  }

  Future<void> repeatNotification() async {
    await _flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      'repeat title',
      'body',
      RepeatInterval.everyMinute,
      _notificationDetails,
      payload: 'payload',
    );
  }

  Future<void> schedule(NotifyModel notify) async {
    _iosNotificationDetails = IOSNotificationDetails();
    _notificationDetails = NotificationDetails(iOS: _iosNotificationDetails);

    var tzDt = tz.TZDateTime.from(notify.sendDate, tz.UTC);
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      notify.id,
      notify.title,
      notify.body,
      tzDt,
      _notificationDetails,
      payload: notify.payload,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: null,
    );
  }

  Future<void> scheduleWithAttachment(NotifyModel notify) async {
    // NOT: iOS dışarıdan indirilen görselleri bildirim için farklı bir yere taşır ve sadece tek bir bildirim için kullanılabilir.
    // Görsel assets içerisinde uygulamaya dahil edilmişse iOS bildirim görselini taşımak yerine kopyalar.
    // Kaynak: https://developer.apple.com/documentation/usernotifications/unnotificationattachment?language=objc
    // Aynı görseli farklı bildirimlerde kullanmak için 2 yol var;
    // 1. Her bildirim planlamasında görselin tekrar indirilip kaydedilmesi.
    // 2. Görselin uygulama içine gömülmesi (Assets içerisine).

    // bildirim görselini indirir ve cihaza kaydeder.
    filePath = await _downloadAndSaveFile(
        'http://dummyimage.com/800x600/000/fff.jpg', 'notifyPicture.jpg');

    // indirilen bildirim görseli ios notification'a eklenir.
    List<IOSNotificationAttachment> attachments =
        List<IOSNotificationAttachment>();
    attachments.add(IOSNotificationAttachment(filePath));

    _iosNotificationDetails = IOSNotificationDetails(attachments: attachments);
    _notificationDetails = NotificationDetails(iOS: _iosNotificationDetails);

    var tzDt = tz.TZDateTime.from(notify.sendDate, tz.UTC);
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      notify.id,
      notify.title,
      notify.body,
      tzDt,
      _notificationDetails,
      payload: notify.payload,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: null,
    );
  }

  Future<int> getPendingNotificationCount() async {
    List<PendingNotificationRequest> list = await getPendingNotifications();
    return list.length;
  }

  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return await _flutterLocalNotificationsPlugin.pendingNotificationRequests();
  }

  Future<void> cancelAllNotification() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory dir = await getApplicationSupportDirectory();
    final String filePath = join(dir.path, fileName);
    final http.Response response = await http.get(url);
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  Future<bool> requestPermission() {
    if (Platform.isIOS) {
      return _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          .requestPermissions(alert: true, badge: true, sound: true);
    }
    return false as Future<bool>;
  }
}
