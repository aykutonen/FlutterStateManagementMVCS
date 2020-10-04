import 'package:flutter/foundation.dart';

class UserModel extends ChangeNotifier {
  List<String> _userPosts;
  List<String> get userPosts => _userPosts;
  set userPosts(List<String> userPosts) {
    _userPosts = userPosts;
    notifyListeners();
  }
  // In the future, this would contain other data about Users, maybe active friend lists, or notifications, etc
}
