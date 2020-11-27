import 'package:flutter/cupertino.dart';

class SettingsModel extends ChangeNotifier {
  String _error = "";
  String get error => _error;

  set error(String error) {
    _error = error;
    notifyListeners();
  }
}
