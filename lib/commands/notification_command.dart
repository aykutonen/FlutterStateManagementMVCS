import 'package:StateManagementMVCS/commands/base_command.dart';
import 'package:StateManagementMVCS/models/notify_model.dart';
import 'package:StateManagementMVCS/utils/notification_helper.dart';

import 'package:supercharged/supercharged.dart';

class NotificationCommand extends BaseCommand {
  Future<bool> getAndSetPermissionAndCalculateOrCleanNotifcation() async {
    bool reqStatus = notifyService.getRequestStatus();
    bool isAllow = await notifyService.getPermissionStatus();

    // Bildirim talebi yapılmışsa bildirim iznini local'e kaydet
    if (reqStatus) {
      // bildirim talebi kaydını kapat
      await notifyService.saveRequestStatus(false);
      await notifyService.savePermissionToLocal(isAllow);
      appModel.notification = isAllow;
    }
    // Bildirim talebi yapılmamışsa
    else {
      // İzin verilmiş ama bizde izinli değilse izin yokmuş gibi akışa devam et.
      if (isAllow && !appModel.notification) {
        isAllow = appModel.notification;
      }
      // Cihazda izin kapalı ama bizde açıksa bizdeki ayarı kapat.
      else if (!isAllow && appModel.notification) {
        await notifyService.savePermissionToLocal(isAllow);
        appModel.notification = isAllow;
      }
    }

    if (isAllow)
      calculateNextNofications();
    else
      NotificationHelper().cancelAllNotification();

    return isAllow;
  }

  Future<bool> requestPermission() async {
    await notifyService.saveRequestStatus(true);
    var status = await notifyService.requestPermission();
    await notifyService.savePermissionToLocal(status);
    appModel.notification = status;
    if (status) calculateNextNofications();
    return status;
  }

  Future<void> removePermission() async {
    await notifyService.saveRequestStatus(false);
    await notifyService.savePermissionToLocal(false);
    NotificationHelper().cancelAllNotification();
    appModel.notification = false;
  }

  bool getPermissionFromLocal() {
    return notifyService.getPermissionFromLocal();
  }

  Future<bool> setPermissionToLocal(bool notify) async {
    return await notifyService.savePermissionToLocal(notify);
  }

  Future<void> calculateNextNofications() async {
    // ios'da maksimum 62 adet bildirim planlanabiliyor.
    int limit = 62;
    // kaç dakikada bir bildirim gönderileceği bilgisi.
    int interval = 1;
    // Uyandıktan sonra ilk bildirim için geçmesi gereken süre
    int afterMinute = 15;
    // Yatmadan önce son bildirim için geçmesi gereken süre
    int beforeMinute = -1 * afterMinute;
    // İlk gönderi zamanını ata
    DateTime sendTime = DateTime.now();

    // Önceden planlanmış ve gönderilmemiş bildirimleri db'den al
    List<NotifyModel> pending = await notifyService.getPendingNotifications();
    if (pending.length > 0) {
      // limiti bekleyen bildirim adedine göre tekrar hesapla. Limiti aşmayalım :)
      limit = limit - pending.length;

      // Son gönderilecek olan kaydı al.
      var lastPending =
          pending.sortedByNum((e) => e.sendDateUnix).reversed.first;

      // Son gönderilecek kayıttan interval değeri kadar saat sonraya ilk gönderiyi planla.
      sendTime = lastPending.sendDate;
    }

    for (var i = 0; i < limit; i++) {
      // gönderi zamanını son gönderiye göre interval kadar dakika sonrası için ayarla.
      sendTime = sendTime.add(Duration(minutes: interval));

      // Uyanma tarihini gönderi tarihine göre ayarla ve 15 dakika ileri al
      var wakeup = DateTime(sendTime.year, sendTime.month, sendTime.day,
              appModel.wakingUp.hour, appModel.wakingUp.minute)
          .add(Duration(minutes: afterMinute));

      // 15 dakika ileri alınca gün dönebilir, tekrar gönderi tarihine geri çek.
      wakeup = DateTime(sendTime.year, sendTime.month, sendTime.day,
          wakeup.hour, wakeup.minute);

      // Yatma tarihini gönderi tarihine göre ayarla ve 15 dakika geri al
      var sleep = DateTime(sendTime.year, sendTime.month, sendTime.day,
              appModel.sleeping.hour, appModel.sleeping.minute)
          .add(Duration(minutes: beforeMinute));

      // 15 dakika geri alınca gün dönümü olabilir, tekrar gönderi tarihine geri çek.
      sleep = DateTime(sendTime.year, sendTime.month, sendTime.day, sleep.hour,
          sleep.minute);

      // Yatma saati kalkma saatinden küçükse (gece 12'den sonra yatıyorsa, sabah 8'de kalkıyor gibi)
      if (sleep.isBefore(wakeup)) {
        if (sendTime.isBetween(sleep, wakeup)) {
          // Sonraki wakeup zamanında gönder.
          sendTime = wakeup;
        }
      }
      // yatma saati kalkma saatinden büyükse (Gece 12'den önce yatıyorsa, sabah 8'de kalkıyor gibi)
      else {
        // Kalkma saatiyle yatma saati arasında değilse
        if (!sendTime.isBetween(wakeup, sleep)) {
          // Sonraki wakeup zamanında gönder
          if (wakeup.isAfter(sendTime))
            sendTime = wakeup;
          else
            sendTime = wakeup.add(Duration(days: 1));
        }
      }

      // Bildirim modelini hazırla
      NotifyModel notify = NotifyModel(
        title: 'title',
        body: 'body',
        payload: 'payload',
        sendDate: sendTime,
      );

      // Bildirimi planla
      notifyService.schedule(notify);
    }
    notifyService.clearOldRecord();
  }

  Future<void> clearAndCalculateNotifications() async {
    await NotificationHelper().cancelAllNotification();
    if (appModel.notification) await calculateNextNofications();
  }
}
