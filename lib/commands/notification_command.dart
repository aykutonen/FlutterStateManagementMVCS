import 'package:StateManagementMVCS/commands/base_command.dart';
import 'package:StateManagementMVCS/models/notify_model.dart';
import 'package:StateManagementMVCS/utils/notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_time_patterns.dart';

import 'package:supercharged/supercharged.dart';

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

  Future<void> calculateNextNofications() async {
    // ios'da maksimum 62 adet bildirim planlanabiliyor.
    int limit = 62;
    // kaç dakikada bir bildirim gönderileceği bilgisi.
    int interval = 90;
    // Uyandıktan sonra ilk bildirim için geçmesi gereken süre
    int afterMinute = 15;
    // Yatmadan önce son bildirim için geçmesi gereken süre
    int beforeMinute = -1 * afterMinute;
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
      // gönderi zamanını son gönderiye göre interval kadar sonrası için ayarla.
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

      NotifyModel notify = NotifyModel(
        title: 'title',
        body: 'body',
        payload: 'payload',
        sendDate: sendTime,
      );

      await notifyService.schedule(notify);
    }
  }
}
