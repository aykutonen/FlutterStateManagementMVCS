import 'package:StateManagementMVCS/models/language_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';
import 'package:flutter/material.dart';
import 'package:StateManagementMVCS/utils/shared_preferences_util.dart';

class AppService {
  Future<bool> saveCurrentUser(String name) async {
    return await Preferences.setString("currentUser", name);
  }

  Future<String> getCurrentUser() async {
    return Preferences.getString("currentUser");
  }

  Future<bool> saveIsFirstTime(bool isFirstTime) async {
    return await Preferences.setBool("IsFirstTime", isFirstTime);
  }

  Future<bool> getIsFirstTime() async {
    return Preferences.getBool("IsFirstTime");
  }

  Future<bool> saveLangugage(Language lang) async {
    // TODO: Language bilgisini local storage'e kaydet
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  Future<bool> saveUnit(Unit unit) async {
    // TODO: Unit bilgisini local storage'e kaydet
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  Future<bool> saveTimeZone(String timeZone) async {
    // TODO: TimeZone bilgisini local storage'e kaydet
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  Future<bool> saveWakingUp(TimeOfDay wakinkUp) async {
    await Preferences.setInt("wakinkup_hour", wakinkUp.hour);
    await Preferences.setInt("wakinkup_minute", wakinkUp.minute);
    return true;
  }

  TimeOfDay getWakingUp() {
    return TimeOfDay(
        hour: Preferences.getInt("wakinkup_hour"),
        minute: Preferences.getInt("wakinkup_minute"));
  }

  Future<bool> saveSleeping(TimeOfDay sleeping) async {
    await Preferences.setInt("sleeping_hour", sleeping.hour);
    await Preferences.setInt("sleeping_minute", sleeping.minute);
    return true;
  }

  TimeOfDay getSleeping() {
    return TimeOfDay(
        hour: Preferences.getInt("sleeping_hour"),
        minute: Preferences.getInt("sleeping_minute"));
  }

  Future<bool> saveTargetAmount(int amount) async {
    // TODO: TargetAmount bilgisini local storage'e kaydet
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  Future<bool> saveNotification(bool notify) async {
    // TODO: Notification bilgisini local storage'e kaydet
    // TODO: Notification servisine kayıt yap ya da kaydı iptal et.
    await Future.delayed(Duration(seconds: 1));
    return true;
  }
}
