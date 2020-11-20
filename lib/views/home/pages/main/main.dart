import 'package:StateManagementMVCS/commands/notification_command.dart';
import 'package:StateManagementMVCS/utils/notification_helper.dart';
import 'package:StateManagementMVCS/views/home/pages/main/widgets/add_drunk_water.dart';
import 'package:StateManagementMVCS/views/home/pages/main/widgets/daily_drunks_list.dart';
import 'package:StateManagementMVCS/views/home/pages/main/widgets/greeting.dart';
import 'package:StateManagementMVCS/views/home/pages/main/widgets/today_drunk_water.dart';
import 'package:StateManagementMVCS/views/home/pages/main/widgets/today_least_water.dart';
import 'package:StateManagementMVCS/views/home/widgets/seperator.dart';
import 'package:StateManagementMVCS/views/home/widgets/sub_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Greeting(),
            const Seperator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TodayDrunkWater(),
                TodayLeastWater(),
              ],
            ),
            const Seperator(),
            const SubTitle(title: 'Daily Logs'),
            const Seperator(height: 20.0),
            DailyDrunkList(),
            const Seperator(),
            const SubTitle(title: 'Add Drunk Water'),
            const Seperator(height: 20.0),
            CupertinoButton(
                child: Text('Notify Permission Request'),
                onPressed: () async {
                  // Bu isten sadece bir kere kullanıcıya gösteriliyor :\
                  // Bu sebeple uygulama ilk açıldığında ya da onboarding'de ilgili sayfada yetki istendiğinde ekstra bir işlem yapmaya gerek yok.
                  // Sonradan Settings sayfasından açmak isterse yetkiyi kontrol edip,
                  // uyarı vermemiz gerekli; Telefonun ayarlarından bildirim iznini açman gerekli diye.
                  // var result = await NotificationHelper().requestPermission();
                  await NotificationCommand().requestPermission();
                }),
            CupertinoButton(
                child: Text('Get Notification Permission Status'),
                onPressed: () async {
                  await NotificationCommand().getAndSetPermission();
                }),
            CupertinoButton(
              child: Text('Notify my'),
              onPressed: () async {
                // await NotificationHelper.showNotification();
                // await NotificationHelper.repeatNotification();
                // await NotificationHelper.cancelAllNotification();
                await NotificationHelper()
                    .schedule(DateTime.now().add(Duration(seconds: 5)));
                // await NotificationHelper()
                //     .schedule(DateTime.now().add(Duration(seconds: 7)));
                // await NotificationHelper()
                //     .schedule(DateTime.now().add(Duration(seconds: 9)));

                var count =
                    await NotificationHelper().getPendingNotificationCount();
                debugPrint(count.toString());
              },
            ),
            AddDrunkWater(),
          ],
        ),
      ),
    );
  }
}
