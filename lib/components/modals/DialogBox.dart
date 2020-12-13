import 'package:flutter/material.dart';

import 'package:flutter_app/components/SimpleButton.dart';
import 'package:flutter_app/utils/widget.dart';

class DialogBox<T> extends StatefulWidget {
  final Widget title;
  final Widget content;
  final void Function() onCancel;
  final void Function() onOk;

  DialogBox({
    this.title,
    this.content,
    this.onCancel,
    this.onOk,
  });

  @override
  _DialogBox createState() => _DialogBox();
}

class _DialogBox extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    var defaultPadding = EdgeInsets.all(8);
    bool existTitle = widget.title != null;
    bool existFooter = widget.onOk != null || widget.onCancel != null;
    var titlePadding = existTitle ? defaultPadding : EdgeInsets.zero;
    var footerPadding = existFooter ? defaultPadding : EdgeInsets.zero;
    double _top = existTitle ? 0 : 10;
    double _bottom = existFooter ? 0 : 10;
    var contentPadding = EdgeInsets.fromLTRB(0, _top, 0, _bottom);

    bool existOkButton = widget.onOk != null;
    bool existCancelButton = widget.onCancel != null;
    int buttonFlex = existOkButton && existCancelButton ? 4 : 8;

    List<Widget> buttons = [
      if (widget.onCancel != null)
        Expanded(
          flex: buttonFlex,
          child: SimpleButton(
            onPressed: () {
              if (widget.onCancel != null) {
                widget.onCancel();
              }
              Navigator.of(context).pop();
            },
            content: Text("取消"),
            simpleButtonStyle: SimpleButtonStyle.disabled,
          ),
        ),
      if (widget.onOk != null)
        Expanded(
          flex: buttonFlex,
          child: SimpleButton(
            onPressed: () {
              if (widget.onOk != null) {
                widget.onOk();
              }
              Navigator.of(context).pop();
            },
            content: Text("确定"),
          ),
        ),
    ];

    return SimpleDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      title: Padding(
        padding: titlePadding,
        child: widget.title,
      ),
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: contentPadding,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 200,
                ),
                child: widget.content,
              ),
            ),
            if (existFooter)
              Padding(
                padding: footerPadding,
                child: Row(
                  children: joinWith(
                    list: buttons,
                    joined: Spacer(flex: 1),
                    rounded: true,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
