import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Webview.dart';

class Link extends StatelessWidget {
  final String href;
  final Widget child;
  // 是否替换当前 route;
  // 当 openInWebview 为 true 时, 该配置无效
  final bool replaced;
  final bool openInWebview;
  final String title;
  // 仅在 openInWebview 为 true 时有效
  final OnMessageCallback onMessage;

  Link({
    @required this.href,
    @required this.child,
    this.replaced = false,
    this.openInWebview = false,
    this.title,
    this.onMessage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: () {
        if (openInWebview) {
          navOnWebview(
            context: context,
            path: href,
            onMessage: onMessage,
            appBar: geneAppBar(
              title: title,
              refreshable: true,
            ),
          );
        } else if (replaced) {
          Navigator.pushReplacementNamed(context, href);
        } else {
          Navigator.pushNamed(context, href);
        }
      },
    );
  }
}
