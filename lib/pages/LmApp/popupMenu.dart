// 右上角弹出式菜单
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app/common/network.dart';
import 'package:flutter_app/common/userModel.dart';
import 'main.dart';

// enum PopupMenuSelections { fir, sec, thir, forth }
// final Map<PopupMenuSelections, String> selectionMap = {
//   PopupMenuSelections.fir: "选择-1",
//   PopupMenuSelections.sec: "选择-2",
//   PopupMenuSelections.thir: "选择-3",
//   PopupMenuSelections.forth: "选择-4",
// };
mixin PopupMenu on State<LmApp> {
  // PopupMenuSelections popupMenuSelection;

  Widget createPopupMenuButton() {
    return Consumer<UserModel>(
      builder: (context, userModel, child) {
        if (userModel.isLogin) {
          BuildContext _context = context;
          String username = userModel.user.username;
          int nameLen = username.length;
          String nameStr = nameLen > 5
              ? username.substring(0, 2) +
                  "..." +
                  username.substring(nameLen - 3)
              : username;
          return FlatButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("退出登录"),
                  content: Text("即将退出登录状态..."),
                  actions: [
                    FlatButton(
                      child: Text("取消"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                      child: Text("退出"),
                      onPressed: () {
                        Navigator.of(context).pop();
                        // 注意 context 的问题, 这儿不能使用 context
                        // 因为 context 只是 Dialog 的 context, 不是 Network 所需的 context
                        // 必须要使用 Button 所在的 context
                        Network(_context).logout();
                      },
                    ),
                  ],
                ),
              );
            },
            // 无论深色还是浅色模式下, 都是白色
            // 注意, 这仅限于 MaterialApp 的蓝色主题
            textColor: Colors.white,
            child: Text(nameStr),
          );
        }
        return IconButton(
          icon: Icon(
            Icons.account_circle,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed("/login");
          },
        );
      },
    );
  }
}
