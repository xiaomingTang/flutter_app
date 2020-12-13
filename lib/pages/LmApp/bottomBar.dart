import 'package:flutter/material.dart';

import 'main.dart';

// 底部切换条
mixin BottomBar on State<LmApp> {
  int _curNavItemIdx = 0;

  String get appBarTitle => [
        "首页",
        "购物车",
        "系统",
      ][_curNavItemIdx];

  PageController pageController = PageController(initialPage: 0);

  void onPageChanged(int index) {
    setState(() {
      _curNavItemIdx = index;
    });
  }

  Widget createBottomBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _curNavItemIdx,
      onTap: (int index) {
        if (index == _curNavItemIdx) {
          return;
        }
        onPageChanged(index);
        pageController.animateToPage(
          index,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "首页",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: "购物车",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "系统",
        ),
      ],
    );
  }
}
