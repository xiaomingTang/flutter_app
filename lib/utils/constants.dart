library constants;

import 'package:flutter/material.dart';

import 'package:flutter_app/models/index.dart' as Models;
import 'package:flutter_app/components/BottomBar.dart';

const String WebviewGlobal = "FlutterWebview";

// ignore: non_constant_identifier_names
final Uri WebRootUri = Uri.https("m.lmoar.com", "/");

final List<Nav> bottomNavs = [
  Nav(
    icon: Icons.home,
    title: "首页",
    route: "/home",
  ),
  Nav(
    icon: Icons.shopping_cart,
    title: "购物车",
    route: "/cart",
  ),
  Nav(
    icon: Icons.settings,
    title: "系统",
    route: "/system",
  ),
];

final List<Models.Banner> defaultBanners = [
  Models.Banner.fromJson({
    "desc": "趣改车",
    "name": "趣改车",
    "category": 1,
    "id": 1759,
    "picture":
        "/uploads/picture/20191212/picture/52218/content_68e2fc654024277f1290d87cb05f916a.jpg",
    "link":
        "/uploads/picture/20191212/picture/52218/content_68e2fc654024277f1290d87cb05f916a.jpg"
  }),
];

final Models.WebTree defaultWebTree = Models.WebTree.fromJson({
  "id": -1,
  "isContainer": false,
  "parentId": -1,
  "name": "暂无数据",
  "brief": "暂无数据",
  "picture": "/vrs/react/static/images/hotspots/graphic-hotspot.png",
  "link": "",
  "tags": [],
  "section": "",
  "userLevel": -1,
  "state": 0,
  "children": [
    {
      "id": -1,
      "isContainer": false,
      "parentId": -1,
      "name": "暂无数据",
      "brief": "暂无数据",
      "picture": "/vrs/react/static/images/hotspots/graphic-hotspot.png",
      "link": "",
      "tags": [],
      "section": "",
      "userLevel": -1,
      "state": 0,
      "children": []
    }
  ]
});
