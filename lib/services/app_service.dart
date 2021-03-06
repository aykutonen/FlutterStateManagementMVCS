import 'dart:convert';

import 'package:StateManagementMVCS/models/gender_model.dart';
import 'package:StateManagementMVCS/models/hour_minute_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';
import 'package:StateManagementMVCS/utils/shared_preferences_util.dart';

class AppService {
  Future<bool> saveCurrentUser(String name) async {
    return await Preferences.setString("currentUser", name);
  }

  String getCurrentUser() {
    return Preferences.getString("currentUser");
  }

  Future<bool> saveIsFirstTime(bool isFirstTime) async {
    return await Preferences.setBool("IsFirstTime", isFirstTime);
  }

  bool getIsFirstTime() {
    return Preferences.getBool("IsFirstTime") ?? true;
  }

  Future<bool> saveUnit(Unit unit) async {
    return await Preferences.setInt("unit", unit.index);
  }

  Unit getUnit() {
    var _index = Preferences.getInt("unit");
    if (_index != null) return Unit.values[_index];
    return null;
  }

  Future<bool> saveWakingUp(HourMinute hourMinute) async {
    return await Preferences.setString("wakingup", json.encode(hourMinute));
  }

  HourMinute getWakingUp() {
    var hmString = Preferences.getString("wakingup");
    if (hmString.isNotEmpty) {
      var parsed = json.decode(hmString);
      if (parsed != null) return HourMinute.fromJson(parsed);
    }
    return null;
  }

  Future<bool> saveSleeping(HourMinute hm) async {
    return await Preferences.setString("sleeping", json.encode(hm));
  }

  HourMinute getSleeping() {
    var hmString = Preferences.getString("sleeping");
    if (hmString.isNotEmpty) {
      var hmParsed = json.decode(hmString);
      if (hmParsed != null) return HourMinute.fromJson(hmParsed);
    }

    return null;
  }

  Future<bool> saveTargetAmount(int amount) async {
    return await Preferences.setInt("target_amount", amount);
  }

  int getTargetAmount() {
    return Preferences.getInt("target_amount");
  }

  Future<bool> saveWeight(int weight) async {
    return Preferences.setInt("weight", weight);
  }

  int getWeight() {
    return Preferences.getInt("weight");
  }

  Future<bool> saveGender(Gender gender) async {
    return await Preferences.setInt("gender", gender.index);
  }

  Gender getGender() {
    var _index = Preferences.getInt("gender");
    if (_index != null) return Gender.values[_index];
    return null;
  }
}
