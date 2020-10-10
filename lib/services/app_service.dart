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
    // await Future.delayed(Duration(seconds: 1));
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
    // TODO: WakinkUp bilgisini local storage'e kaydet
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  Future<bool> saveSleeping(TimeOfDay sleeping) async {
    // TODO: Sleeping bilgisini local storage'e kaydet
    await Future.delayed(Duration(seconds: 1));
    return true;
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
