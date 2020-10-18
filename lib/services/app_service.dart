import 'package:StateManagementMVCS/models/language_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';
import 'package:flutter/material.dart';
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

  Future<bool> saveLangugage(Language lang) async {
    return await Preferences.setInt("lang", lang.index);
  }

  Language getLanguage() {
    var _index = Preferences.getInt("lang");
    if (_index != null) return Language.values[_index];
    return null;
  }

  Future<bool> saveUnit(Unit unit) async {
    return await Preferences.setInt("unit", unit.index);
  }

  Unit getUnit() {
    var _index = Preferences.getInt("unit");
    if (_index != null) return Unit.values[_index];
    return null;
  }

  Future<bool> saveTimeZone(String timeZone) async {
    return await Preferences.setString("time_zone", timeZone);
  }

  String getTimeZone() {
    return Preferences.getString("time_zone");
  }

  Future<bool> saveWakingUp(TimeOfDay wakinkUp) async {
    await Preferences.setInt("wakinkup_hour", wakinkUp.hour);
    await Preferences.setInt("wakinkup_minute", wakinkUp.minute);
    return true;
  }

  TimeOfDay getWakingUp() {
    final _hour = Preferences.getInt("wakinkup_hour");
    final _minute = Preferences.getInt("wakinkup_minute");
    if (_hour != null && _minute != null) {
      return TimeOfDay(hour: _hour, minute: _minute);
    }
    return null;
  }

  Future<bool> saveSleeping(TimeOfDay sleeping) async {
    return await Preferences.setInt("sleeping_hour", sleeping.hour) &&
        await Preferences.setInt("sleeping_minute", sleeping.minute);
  }

  TimeOfDay getSleeping() {
    final _hour = Preferences.getInt("sleeping_hour");
    final _minute = Preferences.getInt("sleeping_minute");
    if (_hour != null && _minute != null) {
      return TimeOfDay(hour: _hour, minute: _minute);
    }
    return null;
  }

  Future<bool> saveTargetAmount(int amount) async {
    return await Preferences.setInt("target_amount", amount);
  }

  int getTargetAmount() {
    return Preferences.getInt("target_amount");
  }

  Future<bool> saveNotification(bool notify) async {
    return await Preferences.setBool("notify", notify);
    // TODO: Notification servisine kayıt yap ya da kaydı iptal et.
  }

  bool getNotification() {
    return Preferences.getBool("notify");
  }
}
