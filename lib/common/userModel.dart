import 'package:flutter/material.dart';

import 'package:flutter_app/common/global.dart';
import 'package:flutter_app/models/index.dart' as Models;

class UserModel extends ChangeNotifier {
  Models.Profile get _profile => Global.profile;
  Models.User get user => _profile.user;
  bool get isLogin => user != null;

  set user(Models.User user) {
    if (user != null) {
      _profile.lastLogin = user?.username;
    }
    if (user?.username != _profile.user?.username) {
      _profile.user = user;
      Global.saveProfile();
      notifyListeners();
    }
  }
}
