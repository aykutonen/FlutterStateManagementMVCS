import 'package:StateManagementMVCS/models/drunk_model.dart';
import 'package:StateManagementMVCS/utils/base_db_helper.dart';

class UserService {
  Future<List<DrunkModel>> getDrunks(DateTime start, DateTime end) async {
    var db = await BaseDbHelper().db;

    var result = List<DrunkModel>();
    var fromDB = await db.query('drunk',
        where: 'trackDateUnix >= ? AND trackDateUnix < ?',
        whereArgs: [start.millisecondsSinceEpoch, end.millisecondsSinceEpoch],
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
