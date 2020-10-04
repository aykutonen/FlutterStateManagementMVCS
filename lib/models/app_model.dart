import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {
  // Kullanıcının adı. Hitap etmek için kullanacağız.
  String _currentUser = "";
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

  // Kullanıcının cihazındaki timezone bilgisi açılışta alınacak.
  // Cihaz ayarları değiştirilirse, uygulama her açıldığında bu bilgiyi kontrol ederek güncelleyecek.
  String _timeZone;
  String get timezone => _timeZone;

  set timeZone(String tz) {
    _timeZone = tz;
    notifyListeners();
  }

  // Kullanıcının uyandığı saat
  TimeOfDay _wakingUp;
  TimeOfDay get wakingUp => _wakingUp;

  set wakingUp(TimeOfDay dt) {
    _wakingUp = dt;
    notifyListeners();
  }

  // Kullanıcının uyuduğu saat
  TimeOfDay _sleeping;
  TimeOfDay get sleeping => _sleeping;

  set sleeping(TimeOfDay dt) {
    _sleeping = dt;
    notifyListeners();
  }

  // Günlük hedeflenen tüketim miktarı
  int _targetAmount;
  int get targetAmount => _targetAmount;

  set targetAmount(int amount) {
    _targetAmount = amount;
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

enum Language { English }

enum Unit { ml, oz }
