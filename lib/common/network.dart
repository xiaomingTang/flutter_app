import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/homeModel.dart';
import 'package:flutter_app/common/userModel.dart';

import 'package:flutter_app/models/index.dart';
import 'package:flutter_app/common/global.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Network {
  static const String customAuthorizationHeader = "Access-Token";
  BuildContext context;
  Options _options;

  Network([this.context]) {
    _options = Options(extra: {"context": context});
  }

  static Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://m.lmoar.com/",
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json',
        customAuthorizationHeader: "",
      },
    ),
  );

  static void init() {
    dio.interceptors.add(Global.netCache);
    dio.options.headers[customAuthorizationHeader] = Global.profile.token;

    // if (!Global.isRelease) {
    //   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //       (client) {
    //     client.findProxy = (uri) {
    //       return "PROXY 0.0.0.0:8000";
    //     };
    //   };
    // }
  }

  Future<User> login(String username, String password) async {
    var res = await dio.post(
      "admin/sign_in.json",
      data: {
        "username": username,
        "password": password,
        "device_id": Global.deviceInfo.id,
      },
      options: _options.merge(
        extra: {
          "noCache": true,
        },
      ),
    );

    if (res.data["user"] == null) {
      String errorMsg = res.data["error"] ?? "请稍后再试";
      Fluttertoast.showToast(
        msg: "登录失败: $errorMsg",
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
      );
      return null;
    }

    User user = User.fromJson(res.data["user"]);
    if (user != null) {
      String token = user.userToken.token;
      //登录成功后更新公共头（authorization），此后的所有请求都会带上用户身份信息
      dio.options.headers[customAuthorizationHeader] = token;
      //清空所有缓存
      Global.netCache.cache.clear();
      //更新profile中的token信息
      Global.profile.token = token;
    }
    // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
    Provider.of<UserModel>(
      context,
      listen: false,
    ).user = user;
    HomeData homeData = await getHome();
    Provider.of<HomeModel>(
      context,
      listen: false,
    ).banners = homeData.banners;
    return user;
  }

  Future<void> logout() async {
    String token = "";
    //登录成功后更新公共头（authorization），此后的所有请求都会带上用户身份信息
    dio.options.headers[customAuthorizationHeader] = token;
    //清空所有缓存
    Global.netCache.cache.clear();
    //更新profile中的token信息
    Global.profile.token = token;
    // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
    Provider.of<UserModel>(
      context,
      listen: false,
    ).user = null;
    HomeData homeData = await getHome();
    Provider.of<HomeModel>(
      context,
      listen: false,
    ).banners = homeData.banners;
  }

  Future<HomeData> getHome() async {
    String url = "/api/v1/home";
    var res = await dio.get(url);
    return HomeData.fromJson(res.data);
  }

  Future<WebTree> getWebTree() async {
    String url =
        WebRootUri.resolve("/vrs/react/static/sync-datas/raw-data.json")
            .toString();
    var res = await dio.get(url);
    return WebTree.fromJson(res.data);
  }
}
