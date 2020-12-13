import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:flutter_app/pages/LmApp/main.dart';
import 'package:flutter_app/common/global.dart';
import 'package:flutter_app/common/homeModel.dart';
import 'package:flutter_app/common/themeModel.dart';
import 'package:flutter_app/common/userModel.dart';

void main() {
  // 如果需要异步运行 runApp, 必须要下面这句
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((e) {
    runApp(
      MultiProvider(
        providers: <SingleChildWidget>[
          ChangeNotifierProvider.value(value: UserModel()),
          ChangeNotifierProvider.value(value: HomeModel()),
          ChangeNotifierProvider.value(value: ThemeModel()),
        ],
        child: LmApp(),
      ),
    );
  });
}
