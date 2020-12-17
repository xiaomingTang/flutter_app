// 见 https://github.com/flutter/flutter/issues/36869#issuecomment-518118441

import 'package:flutter/material.dart';

const defaultAxes = [
  Axis.horizontal,
  Axis.vertical,
];

void dismissKeyboard(context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.focusedChild?.unfocus();
  }
}

class DismissKeyboardOnScroll extends StatelessWidget {
  final Widget child;
  final Function onDismiss;
  final List<Axis> axes;

  const DismissKeyboardOnScroll(
      {Key key, this.child, this.onDismiss, this.axes = defaultAxes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollStartNotification>(
      child: child,
      // return false 是为了让事件继续触发
      onNotification: (notification) {
        var _axis = notification.metrics?.axis;
        if (_axis != null && axes.contains(_axis)) {
          dismissKeyboard(context);
          if (onDismiss != null) {
            onDismiss();
          }
        }

        return false;
      },
    );
  }
}

class DismissKeyboardOnTap extends StatelessWidget {
  final Widget child;
  final Function onDismiss;

  const DismissKeyboardOnTap({Key key, this.child, this.onDismiss})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: () {
        dismissKeyboard(context);
        if (onDismiss != null) {
          onDismiss();
        }
      },
    );
  }
}
