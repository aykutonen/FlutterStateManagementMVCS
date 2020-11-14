import 'package:StateManagementMVCS/commands/user_command.dart';
import 'package:StateManagementMVCS/models/gender_model.dart';
import 'package:StateManagementMVCS/models/hour_minute_model.dart';
import 'package:StateManagementMVCS/models/language_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';
import 'package:international_system_of_units/international_system_of_units.dart';

import 'base_command.dart';

class AppCommand extends BaseCommand {
  Future<void> init() async {
    appModel.currentUser = appService.getCurrentUser();
    appModel.isFirstTime = appService.getIsFirstTime();
    appModel.sleeping = appService.getSleeping();
    appModel.wakingUp = appService.getWakingUp();
    appModel.unit = appService.getUnit();
    appModel.targetAmount = appService.getTargetAmount();
    appModel.weight = appService.getWeight();
    appModel.language = appService.getLanguage();
    appModel.gender = appService.getGender();
    appModel.notification = appService.getNotification();
  }

  Future<bool> saveUsername(String name) async {
    // Service üzerinden local storage'de currentUser güncelle.
    bool result = await appService.saveCurrentUser(name);

    // Service işlemi başarılıysa model'i güncelle
    if (result) appModel.currentUser = name;

    return result;
  }

  Future<bool> saveIsFirstTime(bool isFirstTime) async {
    // Service üzerinden local storage'de isFirstTime değerini güncelle.
    bool result = await appService.saveIsFirstTime(isFirstTime);

    // Service işlemi başarılıysa model'i güncelle
    if (result) appModel.isFirstTime = isFirstTime;

    return result;
  }

  Future<bool> setLanguage(Language lang) async {
    // Service üzerinden local storage'de Language değerini güncelle.
    bool result = await appService.saveLangugage(lang);

    // Service işlemi başarılıysa model'i güncelle
    if (result) appModel.language = lang;

    return result;
  }

  Future<bool> setUnit(Unit unit) async {
    // Service üzerinden local storage'de Unit değerini güncelle.
    bool result = await appService.saveUnit(unit);

    // Service işlemi başarılıysa model'i güncelle
    if (result) appModel.unit = unit;

    return result;
  }

  Future<bool> setWakingUp(HourMinute hm) async {
    // Service üzerinden local storage'de WakingUp değerini güncelle.
    bool result = await appService.saveWakingUp(hm);

    // Service işlemi başarılıysa model'i güncelle
    if (result) {
      appModel.wakingUp = hm;
      userModel.dailyDrunks = await UserCommand().getDailyDrunks();
    }

    return result;
  }

  Future<bool> setSleeping(HourMinute hm) async {
    // Service üzerinden local storage'de Sleeping değerini güncelle.
    bool result = await appService.saveSleeping(hm);

    // Service işlemi başarılıysa model'i güncelle
    if (result) appModel.sleeping = hm;

    return result;
  }

  Future<bool> setTargetAmount(int amount) async {
    // Service üzerinden local storage'de TargetAmount değerini güncelle.
    bool result = await appService.saveTargetAmount(amount);

    // Service işlemi başarılıysa model'i güncelle
    if (result) appModel.targetAmount = amount;

    return result;
  }

  Future<bool> setWeight(double weight) async {
    // KG cinsindeki ve double tipindeki ağırlık önce gram'a sonra da int'e çevriliyor.
    int _weight = weight.toGram.toInt();
    bool result = await appService.saveWeight(_weight);
    if (result) appModel.weight = _weight;
    return result;
  }

  Future<bool> setGender(Gender gender) async {
    bool result = await appService.saveGender(gender);
    if (result) appModel.gender = gender;
    return result;
  }

  Future<bool> setNotification(bool notify) async {
    // Service üzerinden local storage'de Notification değerini güncelle.
    bool result = await appService.saveNotification(notify);

    // Service işlemi başarılıysa model'i güncelle
    if (result) appModel.notification = notify;

    return result;
  }
}
