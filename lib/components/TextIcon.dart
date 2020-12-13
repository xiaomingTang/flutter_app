import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {
  final Widget leading;
  final Widget trailing;
  final Widget content;
  final double space;

  TextIcon({
    this.leading,
    this.trailing,
    @required this.content,
    this.space = 5,
  });

  @override
  Widget build(context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (leading != null) leading,
        if (leading != null) SizedBox(width: space),
        content,
        if (trailing != null) SizedBox(width: space),
        if (trailing != null) trailing,
      ],
    );
  }
}
