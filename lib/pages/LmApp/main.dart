import 'package:flutter/material.dart';
import 'package:flutter_app/components/DismissKeyboard.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app/pages/Cart.dart';
import 'package:flutter_app/pages/Home.dart';
import 'package:flutter_app/pages/KeepAlivePage.dart';
import 'package:flutter_app/pages/Sign.dart';
import 'package:flutter_app/pages/System.dart';
import 'package:flutter_app/common/themeModel.dart';
import 'quickAction.dart';
import 'popupMenu.dart';
import 'bottomBar.dart';
import 'DarkModeListener.dart';

class LmApp extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<LmApp> with QuickAction, PopupMenu, BottomBar {
  @override
  Widget build(BuildContext context) {
    return DarkModeListener(
      child: Consumer<ThemeModel>(
        builder: (context, themeModel, child) => MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text(appBarTitle),
              actions: [
                createPopupMenuButton(),
              ],
            ),
            bottomNavigationBar: createBottomBar(),
            body: DismissKeyboardOnScroll(
              // PageView 中, 横向滚动时移除键盘
              axes: [Axis.horizontal],
              child: PageView(
                controller: pageController,
                onPageChanged: onPageChanged,
                children: [
                  KeepAlivePage(child: Home()),
                  KeepAlivePage(child: Cart()),
                  KeepAlivePage(child: System()),
                ],
              ),
            ),
          ),
          theme: themeModel.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          debugShowCheckedModeBanner: false,
          routes: {
            "/login": (context) => LoginRoute(),
          },
        ),
      ),
    );
  }
}
