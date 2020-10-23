import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/models/drunk_model.dart';
import 'package:flutter/foundation.dart';

class UserModel extends ChangeNotifier {
  // Günlük tüketim verisi...
  List<DrunkModel> _dailyDrunks = List<DrunkModel>();
  List<DrunkModel> get dailyDrunks => _dailyDrunks;
  set dailyDrunks(List<DrunkModel> drunks) {
    _dailyDrunks = drunks;
    notifyListeners();
  }

  int get dailyTotalDrunk => _dailyDrunks
      .map<int>((e) => e.amount)
      .reduce((value, element) => value + element);

  // In the future, this would contain other data about Users, maybe active friend lists, or notifications, etc
}
