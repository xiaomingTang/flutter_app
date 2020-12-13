import 'package:flutter/material.dart';

import 'package:flutter_app/common/global.dart';
import 'package:flutter_app/models/index.dart' as Models;
import 'package:flutter_app/utils/constants.dart';

class _HomeChangeNotifier extends ChangeNotifier {}

class HomeModel extends _HomeChangeNotifier {
  List<Models.Banner> get banners => Global.banners;

  set banners(List<Models.Banner> _banners) {
    if (_banners == null || _banners.length == 0) {
      Global.banners = defaultBanners;
    } else {
      Global.banners = _banners;
    }
    notifyListeners();
  }
}
