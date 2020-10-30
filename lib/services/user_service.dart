import 'package:StateManagementMVCS/models/drunk_model.dart';
import 'package:StateManagementMVCS/models/hour_minute_model.dart';
import 'package:StateManagementMVCS/utils/base_db_helper.dart';

class UserService {
  Future<List<DrunkModel>> getDailyDrunks(HourMinute wakeup) async {
    var db = await BaseDbHelper().db;
    var dt = DateTime.now();
    var dayStart = DateTime(dt.year, dt.month, dt.day);

    var todayWakeup =
        DateTime(dt.year, dt.month, dt.day, wakeup.hour, wakeup.minute);

    if ((dt.isAtSameMomentAs(dayStart) || dt.isAfter(dayStart)) &&
        dt.isBefore(todayWakeup)) {
      dt = dt.add(Duration(days: -1));
    }

    var today = DateTime(
      dt.year,
      dt.month,
      dt.day,
      wakeup.hour,
      wakeup.minute,
    ).toUtc();
    var nextday = today.add(Duration(days: 1));

    var result = List<DrunkModel>();
    var fromDB = await db.query('drunk',
        where: 'createDateUnix >= ? AND createDateUnix < ?',
        whereArgs: [
          today.millisecondsSinceEpoch,
          nextday.millisecondsSinceEpoch
        ],
        orderBy: 'createDateUnix DESC');

    if (fromDB.isNotEmpty) {
      fromDB.forEach((element) {
        result.add(DrunkModel.fromJson(element));
      });
    }

    return result;
  }

  Future<bool> addDrunk(DrunkModel model) async {
    var db = await BaseDbHelper().db;

    model.id = await db.insert('drunk', model.toMap());
    return model.id > 0;
  }
}
