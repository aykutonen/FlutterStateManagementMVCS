import 'package:StateManagementMVCS/models/drunk_model.dart';
import 'package:StateManagementMVCS/utils/base_db_helper.dart';

class UserService {
  Future<List<DrunkModel>> getDailyDrunks() async {
    var db = await BaseDbHelper().db;
    var dt = DateTime.now();
    var today = DateTime(dt.year, dt.month, dt.day).toUtc();
    var nextday = today.add(Duration(days: 1));

    var result = List<DrunkModel>();
    var fromDB = await db.query('drunk',
        where: '(createDateUnix >= ?) OR (createDateUnix < ?)',
        whereArgs: [
          today.microsecondsSinceEpoch,
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
