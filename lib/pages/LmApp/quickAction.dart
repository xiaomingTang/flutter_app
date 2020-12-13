// 桌面快捷菜单
import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

import 'main.dart';

mixin QuickAction on State<LmApp> {
  @override
  void initState() {
    super.initState();
    final QuickActions quickActions = QuickActions();

    quickActions.initialize((String shortcut) {
      setState(() {
        // 针对不同的 shortcur 执行不同事件处理
      });
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      // NOTE: This first action icon will only work on iOS.
      // In a real world project keep the same file name for both platforms.
      const ShortcutItem(
        type: 'action_one',
        localizedTitle: 'Action 1',
        icon: 'ic_pinhua_2',
      ),
      // NOTE: This second action icon will only work on Android.
      // In a real world project keep the same file name for both platforms.
      const ShortcutItem(
        type: 'action_two',
        localizedTitle: 'Action 2',
        icon: 'ic_launcher',
      ),
    ]);
  }
}
