import 'package:flutter/material.dart';

import 'package:flutter_app/utils/log.dart';

Future<void> showMySimpleDialog(BuildContext context) async {
  String result = await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Reset settings?'),
        content: Text(
            'This will reset your device to its default factory settings.'),
        actions: [
          FlatButton(
            // textColor: Color(0xFF6200EE),
            onPressed: () {
              Navigator.pop(context, "取消了");
            },
            child: Text('取消'),
          ),
          FlatButton(
            // textColor: Color(0xFF6200EE),
            onPressed: () {
              Navigator.pop(context, "接受了");
            },
            child: Text('接受'),
          ),
        ],
      );
    },
  );
  logWarn(result);
}
