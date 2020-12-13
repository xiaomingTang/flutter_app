import 'dart:convert';

import 'package:flutter_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_app/common/network.dart';
import 'package:flutter_app/common/device.dart';
import 'package:flutter_app/common/netCache.dart';
import 'package:flutter_app/models/index.dart' as Models;

class Global {
  static SharedPreferences _prefs;

  static List<Models.Banner> banners = defaultBanners;
  static Models.AppConfigs appConfigs = Models.AppConfigs();
  // 用户信息, 主要为 name 及 token 缓存
  static Models.Profile profile = Models.Profile();
  // 网络缓存对象
  static NetCache netCache = NetCache();
  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");
  static TDeviceInfo deviceInfo = defaultDeviceInfo;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    deviceInfo = await getDeviceInfo();
    // profile 初始化
    String _profile = _prefs.getString("__profile__");
    if (_profile != null) {
      try {
        profile = Models.Profile.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    }
    profile.cache = profile.cache ?? Models.CacheConfig()
      ..enable = true
      ..maxAge = 1000
      ..maxCount = 100;

    // theme 初始化
    String _appConfigs = _prefs.getString("__appConfigs__");
    if (_appConfigs != null) {
      try {
        appConfigs = Models.AppConfigs.fromJson(jsonDecode(_appConfigs));
      } catch (e) {
        print(e);
      }
    }

    Network.init();
  }

  static saveAppConfigs() =>
      _prefs.setString("__appConfigs__", jsonEncode(appConfigs.toJson()));

  static saveProfile() =>
      _prefs.setString("__profile__", jsonEncode(profile.toJson()));
}
