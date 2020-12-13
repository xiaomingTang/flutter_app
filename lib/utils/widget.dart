import 'package:flutter/material.dart';

List<Widget> joinWith({
  @required List<Widget> list,
  @required Widget joined,
  bool rounded = false,
}) {
  List<Widget> newList = [];
  int len = list.length;

  // 添加首部
  if (rounded && len > 0) {
    newList.add(joined);
  }

  for (var i = 0; i < len; i += 1) {
    Widget item = list[i];
    if (i != len - 1) {
      newList.add(item);
      newList.add(joined);
    } else {
      newList.add(item);
    }
  }

  // 添加尾部
  if (rounded && len > 0) {
    newList.add(joined);
  }

  return newList;
}
