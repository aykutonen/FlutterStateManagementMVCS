import 'package:StateManagementMVCS/models/drunk_model.dart';
import 'package:flutter/foundation.dart';

/// Rapor sayfası modeli
class ReportModel extends ChangeNotifier {
  DateTime _currentDate;
  DateTime get currentDate => _currentDate;
  set currentDate(DateTime date) {
    _currentDate = date;
    notifyListeners();
  }

  List<DrunkModel> _drunks = List<DrunkModel>();
  List<DrunkModel> get drunks => _drunks;
  set drunks(List<DrunkModel> data) {
    _drunks = data;
    _calculationTotal();
    notifyListeners();
  }

  int _totalDrunk = 0;
  int get totalDrunk => _totalDrunk;
  set totalDrunk(int data) {
    _totalDrunk = data;
    notifyListeners();
  }

  void _calculationTotal() {
    if (drunks.isNotEmpty) {
      totalDrunk = drunks
          .map((e) => e.amount)
          .reduce((value, element) => value + element);
    } else {
      totalDrunk = 0;
    }
  }
}
