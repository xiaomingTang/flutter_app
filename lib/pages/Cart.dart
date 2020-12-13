import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _state = 0;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          color: Colors.grey,
          child: Center(
            child: Column(
              children: [
                Text("购物车"),
                ElevatedButton(
                  child: Text("Cart-$_state"),
                  onPressed: () {
                    setState(() {
                      _state += 1;
                    });
                  },
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
