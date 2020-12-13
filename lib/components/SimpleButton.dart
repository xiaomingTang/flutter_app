import 'package:flutter/material.dart';

enum SimpleButtonStyle {
  disabled,
  primary,
  danger,
}

class SimpleButton extends StatelessWidget {
  final Widget leading;
  final Widget trailing;
  final Widget content;
  final SimpleButtonStyle simpleButtonStyle;
  final void Function() onPressed;
  final void Function() onLongPress;

  SimpleButton({
    this.leading,
    this.trailing,
    @required this.content,
    this.simpleButtonStyle,
    this.onPressed,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    switch (simpleButtonStyle) {
      case SimpleButtonStyle.disabled:
        backgroundColor = Colors.grey[400];
        break;
      case SimpleButtonStyle.danger:
        backgroundColor = Theme.of(context).colorScheme.error;
        break;
      default:
        backgroundColor = Theme.of(context).colorScheme.primary;
        break;
    }
    return ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: (onPressed == null && onLongPress == null)
          ? null
          : ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) => backgroundColor),
            ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) leading,
          Padding(
            padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
            child: content,
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }
}
