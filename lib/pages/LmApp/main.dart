import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app/common/themeModel.dart';
import 'package:flutter_app/pages/main.dart' as Pages;
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
            body: PageView(
              controller: pageController,
              onPageChanged: onPageChanged,
              children: [
                Pages.KeepAlivePage(child: Pages.Home()),
                Pages.KeepAlivePage(child: Pages.Cart()),
                Pages.KeepAlivePage(child: Pages.System()),
              ],
            ),
          ),
          theme: themeModel.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          debugShowCheckedModeBanner: false,
          routes: {
            "/login": (context) => Pages.LoginRoute(),
          },
        ),
      ),
    );
  }
}
