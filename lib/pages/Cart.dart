import 'package:flutter/material.dart';
import 'package:flutter_app/components/DismissKeyboard.dart';
import 'package:flutter_app/utils/log.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  TextEditingController _controller;
  String get _text {
    return _controller.text.trim();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    logWarn(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    final _node = FocusScope.of(context);
    return RefreshIndicator(
      child: SingleChildScrollView(
        // 加了 constraints minHeight, 所以不需要 AlwaysScrollableScrollPhysics
        // physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  // 如果在 PageView + KeepAlivePage 中使用 autofocus
                  // 页面在 KeepAlive 之后就不会 autofocus 了
                  // 所以还是不用了
                  controller: _controller,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Type whatever you want',
                    contentPadding: EdgeInsets.all(8),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                if (_text.isNotEmpty) Text(_text),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("提交"),
                    onPressed: () {
                      _node.unfocus();
                      _submit();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 2), () {
          Fluttertoast.showToast(
            msg: "刷新成功",
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black87,
            textColor: Colors.white,
          );
        });
        // logWarn("onRefresh");
        // return;
        // return "success";
      },
      color: Theme.of(context).primaryColor,
    );
  }
}
