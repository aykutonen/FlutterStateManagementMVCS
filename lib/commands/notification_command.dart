import 'package:StateManagementMVCS/commands/base_command.dart';
import 'package:StateManagementMVCS/models/notify_model.dart';
import 'package:StateManagementMVCS/utils/notification_helper.dart';

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
    int interval = 2;
    // Uyandıktan sonra ilk bildirim için geçmesi gereken süre
    int afterMinute = 15;
    // Yatmadan önce son bildirim için geçmesi gereken süre
    int beforeMinute = -1 * afterMinute;
    int limit = 62;
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

    // Limit kadar dön ve 2 saatte bir bildirim planla.
    for (var i = 0; i < limit; i++) {
      // Gönderi zamanını öncekine göre 2 saat sonraya ayarla.
      sendTime = sendTime.add(Duration(minutes: interval));

      // Gönderi tarihine göre kullanıcının yatma ve kalkma tarihlerni hesapla
      DateTime wakeup = DateTime(sendTime.year, sendTime.month, sendTime.day,
              appModel.wakingUp.hour, appModel.wakingUp.minute)
          .add(Duration(minutes: afterMinute));
      DateTime sleep = DateTime(sendTime.year, sendTime.month, sendTime.day,
              appModel.sleeping.hour, appModel.sleeping.minute)
          .add(Duration(minutes: beforeMinute));

      // Yatma saati kalkma saatinden önceyse yatma saatini sonraki güne ayarla (gün devri var demektir).
      if (sleep.isBefore(wakeup)) sleep.add(Duration(days: 1));

      // Bildirim gönderi zamanına göre yatma ve kalkma saatilerini karşılaştır.
      // Gönderi zamanı kullanıcının uyuduğu zaman aralığındaysa; uyandıktan afterMinute değeri kadar dakika sonra gönderilsin.
      if (!sendTime.isBetween(wakeup, sleep)) {
        sendTime = DateTime(sendTime.year, sendTime.month, sendTime.day,
            wakeup.hour, wakeup.minute);
      }

      // bildirim kaydını db'ye kaydet ve cihazda oluştur.
      NotifyModel notify = NotifyModel(
        title: 'title',
        body: 'body',
        payload: 'payload',
        sendDate: sendTime,
      );

      await notifyService.schedule(notify);
    }
    // Planlanan bildirimleri db'ye kaydet, bildirim kaydı için id gerekli ve sonrasında hangi bildirimler planlandı, gönderildi durumları için db'de tutmak gerekli.
  }
}
