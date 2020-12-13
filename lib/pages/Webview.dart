import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/TextIcon.dart';
import 'package:flutter_app/utils/log.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter_app/utils/constants.dart' as Constants;

final _webviewKey = GlobalKey<WebviewPageState>();

typedef OnMessageCallback = void Function(String message);

class WebviewPage extends StatefulWidget {
  final key = _webviewKey;
  final String path;
  final OnMessageCallback onMessage;
  final AppBar appBar;

  WebviewPage({
    @required this.path,
    this.appBar,
    this.onMessage,
  });

  @override
  WebviewPageState createState() => WebviewPageState();
}

class WebviewPageState extends State<WebviewPage> {
  WebViewController _webViewController;
  bool _isLoading = true;

  void reload() {
    _webViewController.reload();
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      // We're using a Builder here so we have a context that is below the Scaffold
      // to allow calling Scaffold.of(context) so we can show a snackbar.
      // 详见 https://pub.dev/packages/webview_flutter/example
      body: Stack(
        children: <Widget>[
          Builder(
            builder: (BuildContext context) {
              return WebView(
                onWebResourceError: (error) {
                  // TODO 写一个自定义 webview 错误页
                  logWarn("error, ${error.description}");
                },
                initialUrl: widget.path,
                onWebViewCreated: (controller) {
                  setState(() {
                    _webViewController = controller;
                  });
                },
                onPageFinished: (s) {
                  setState(() {
                    _isLoading = false;
                  });
                },
                javascriptMode: JavascriptMode.unrestricted,
                javascriptChannels: <JavascriptChannel>[
                  JavascriptChannel(
                    name: Constants.WebviewGlobal,
                    onMessageReceived: (JavascriptMessage message) {
                      if (widget.onMessage != null) {
                        widget.onMessage(message.message);
                      }
                    },
                  ),
                ].toSet(),
              );
            },
          ),
          _isLoading ? Center(child: CircularProgressIndicator()) : Stack(),
        ],
      ),
    );
  }
}

void navOnWebview({
  @required BuildContext context,
  @required String path,
  AppBar appBar,
  OnMessageCallback onMessage,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext ctx) => WebviewPage(
        path: path,
        appBar: appBar,
        onMessage: onMessage,
      ),
    ),
  );
}

enum AppBarActions {
  refresh,
}

AppBar geneAppBar({
  String title,
  bool refreshable = true,
}) {
  bool hasActions = refreshable;
  return AppBar(
    title: Text(title),
    actions: [
      if (hasActions)
        PopupMenuButton<AppBarActions>(
          onSelected: (result) {
            switch (result) {
              case AppBarActions.refresh:
                _webviewKey?.currentState?.reload();
                break;
              default:
                break;
            }
          },
          // 不继承样式
          // 否则 PopupMenuItem 中的 icon 会从 appBar 中继承 "白色字体颜色" 这个样式, 配合上白色背景, 就看不见了
          captureInheritedThemes: false,
          itemBuilder: (context) => <PopupMenuEntry<AppBarActions>>[
            if (refreshable)
              PopupMenuItem(
                child: TextIcon(
                  leading: Icon(Icons.refresh),
                  content: Text("刷新"),
                ),
                // ListTile(
                //   leading: Icon(Icons.refresh),
                //   title: Text("刷新"),
                //   dense: true,
                // ),
                value: AppBarActions.refresh,
              ),
          ],
        ),
    ],
  );
}
