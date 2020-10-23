import 'dart:convert';

import 'package:StateManagementMVCS/models/drunk_model.dart';
import 'package:StateManagementMVCS/utils/shared_preferences_util.dart';

class UserService {
  Future<bool> login(String user, String pass) async {
    // Fake a network service call, and return true
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  Future<bool> logout() async {
    // Fake a network service call, and return true
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  List<DrunkModel> getDailyDrunks() {
    var data = Preferences.getString("drunks");
    var result = List<DrunkModel>();
    if (data.isNotEmpty) {
      var list = json.decode(data) as List;
      var dt = DateTime.now();
      var today = DateTime(
        dt.year,
        dt.month,
        dt.day,
      );
      result = list
          .map((e) => DrunkModel.fromJson(e))
          .where((e) =>
              today.isBefore(e.createDate) ||
              today.isAtSameMomentAs(e.createDate))
          .toList();
    }
    return result;
  }

  Future<bool> addDrunk(DrunkModel model) async {
    var data = Preferences.getString("drunks");
    List<DrunkModel> result = List<DrunkModel>();
    if (data.isNotEmpty) {
      var list = json.decode(data) as List;
      result = list.map((e) => DrunkModel.fromJson(e)).toList();
    }
    result.add(model);
    String parsed = json.encode(result);
    return await Preferences.setString("drunks", parsed);
  }
}
