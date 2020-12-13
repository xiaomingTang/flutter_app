import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app/common/themeModel.dart';

// 其祖先元素必须提供 ThemeModel
class DarkModeListener extends StatefulWidget {
  final Widget child;

  DarkModeListener({@required this.child});

  @override
  _DarkModeListenerState createState() => _DarkModeListenerState();
}

class _DarkModeListenerState extends State<DarkModeListener>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // 监听系统深色模式切换
  // 亮度的改变 并不会 触发该函数
  @override
  void didChangePlatformBrightness() {
    Provider.of<ThemeModel>(context, listen: false).updateTheme();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
