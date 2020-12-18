import 'package:flutter/material.dart';
import 'package:flutter_app/components/TImageIcon.dart';
import 'package:flutter_app/models/index.dart';
import 'package:flutter_app/pages/Webview.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/utils/widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WebTreeComp extends StatefulWidget {
  final WebTree webTree;

  WebTreeComp({this.webTree});

  @override
  _WebTreeCompState createState() => _WebTreeCompState();
}

class _WebTreeCompState extends State<WebTreeComp> {
  @override
  Widget build(BuildContext context) {
    WebTree webTree = widget.webTree;
    if (widget.webTree == null || widget.webTree.children.length == 0) {
      webTree = defaultWebTree;
    }

    List<Widget> list = webTree.children.map((childItem) {
      String _iconPath = childItem?.picture ?? "";
      String iconPath =
          _iconPath.isEmpty ? "" : WebRootUri.resolve(_iconPath).toString();
      String name = childItem?.name ?? "xxxx";
      bool isContainer = childItem.children.length > 0;
      String link = childItem.link.isEmpty
          ? ""
          : WebRootUri.resolve(childItem.link).toString();
      bool isLink = link.isNotEmpty;

      return ListTile(
        leading: TImageIcon(src: iconPath),
        trailing: isContainer
            ? Icon(Icons.chevron_right)
            : isLink
                ? Icon(Icons.link)
                : Icon(Icons.error_outline),
        title: Text(name),
        onTap: () {
          if (isContainer) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: Text(name),
                  ),
                  body: SingleChildScrollView(
                    child: WebTreeComp(
                      webTree: childItem,
                    ),
                  ),
                ),
              ),
            );
          } else if (isLink) {
            navOnWebview(
              context: context,
              path: link,
              appBar: geneAppBar(
                title: name,
                refreshable: true,
              ),
            );
          } else {
            Fluttertoast.showToast(
              msg: "未知项",
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.black87,
              textColor: Colors.white,
            );
          }
        },
      );
    }).toList();

    return Column(
      children: joinWith(
        list: list,
        joined: Divider(),
      ),
    );
  }
}
