import 'package:StateManagementMVCS/models/gender_model.dart';
import 'package:StateManagementMVCS/models/hour_minute_model.dart';
import 'package:StateManagementMVCS/models/language_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';
import 'package:international_system_of_units/international_system_of_units.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {
  // Kullanıcının adı. Hitap etmek için kullanacağız.
  String _currentUser;
  String get currentUser => _currentUser;

  set currentUser(String currentUser) {
    _currentUser = currentUser;
    notifyListeners();
  }

  // Kullanıcı ilk kez uygulamayı açtığında True değeri atanır.
  // Onboarding ekranı gösterildikten sonra "False" değeri atanır.
  bool _isFirstTime = true;
  bool get isFirstTime => _isFirstTime;

  set isFirstTime(bool isFirstTime) {
    _isFirstTime = isFirstTime;
    notifyListeners();
  }

  // Kullanıcının seçtiği dil.
  Language _language = Language.English;
  Language get language => _language;

  set language(Language lang) {
    _language = lang;
    notifyListeners();
  }

  // Su tüketim birimi
  // Gösterim sırasında hesapmalar buna göre yapılacak.
  Unit _unit;
  Unit get unit => _unit;

  set unit(Unit unit) {
    _unit = unit;
    notifyListeners();
  }

  // Kullanıcının uyandığı saat
  HourMinute _wakingUp;
  HourMinute get wakingUp => _wakingUp;

  set wakingUp(HourMinute hm) {
    _wakingUp = hm;
    notifyListeners();
  }

  // Kullanıcının uyuduğu saat
  HourMinute _sleeping;
  HourMinute get sleeping => _sleeping;

  set sleeping(HourMinute hm) {
    _sleeping = hm;
    notifyListeners();
  }

  // Günlük hedeflenen tüketim miktarı
  int _targetAmount;
  int get targetAmount => _targetAmount;

  set targetAmount(int amount) {
    _targetAmount = amount;
    notifyListeners();
  }

  int _weight;
  int get weight => _weight;
  double get weightDouble => _weight.toKilogram(MassUnit.gram).toDouble();
  set weight(int w) {
    _weight = w;
    notifyListeners();
  }

  Gender _gender;
  Gender get gender => _gender;
  set gender(Gender g) {
    _gender = g;
    notifyListeners();
  }

  // Mobil bildirim alıp almak istemediği bilgisi
  bool _notification = false;
  bool get notification => _notification;

  set notification(bool notify) {
    _notification = notify;
    notifyListeners();
  }

  // Eventually other stuff would go here, appSettings, premiumUser flags, currentTheme, etc...
}
