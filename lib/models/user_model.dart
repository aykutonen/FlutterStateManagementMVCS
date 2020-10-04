import 'package:StateManagementMVCS/models/drunk_model.dart';
import 'package:flutter/foundation.dart';

class UserModel extends ChangeNotifier {
  List<String> _userPosts;
  List<String> get userPosts => _userPosts;
  set userPosts(List<String> userPosts) {
    _userPosts = userPosts;
    notifyListeners();
  }

  // Günlük tüketim verisi...
  List<DrunkModel> _dailyDrunks;
  List<DrunkModel> get dailyDrunks => _dailyDrunks;
  set dailyDrunks(List<DrunkModel> drunks) {
    _dailyDrunks = drunks;
    notifyListeners();
  }

  // In the future, this would contain other data about Users, maybe active friend lists, or notifications, etc
}
