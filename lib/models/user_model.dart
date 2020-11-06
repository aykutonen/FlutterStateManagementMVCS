import 'package:StateManagementMVCS/models/drunk_model.dart';
import 'package:flutter/foundation.dart';

class UserModel extends ChangeNotifier {
  // Günlük tüketim verisi...
  List<DrunkModel> _dailyDrunks = List<DrunkModel>();
  List<DrunkModel> get dailyDrunks => _dailyDrunks;
  set dailyDrunks(List<DrunkModel> drunks) {
    _dailyDrunks = drunks;
    _calculateDailyTotal();
    notifyListeners();
  }

  int _dailyTotalDrunk = 0;
  int get dailyTotalDrunk => _dailyTotalDrunk;
  set dailyTotalDrunk(int total) {
    _dailyTotalDrunk = total;
    notifyListeners();
  }

  void _calculateDailyTotal() {
    if (_dailyDrunks.isNotEmpty) {
      dailyTotalDrunk = dailyDrunks
          .map<int>((e) => e.amount)
          .reduce((value, element) => value + element);
    } else {
      dailyTotalDrunk = 0;
    }
  }

  // In the future, this would contain other data about Users, maybe active friend lists, or notifications, etc
}
