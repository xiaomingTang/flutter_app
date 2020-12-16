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
                Text("购物车"),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("Cart-$_state"),
                    onPressed: () {
                      setState(() {
                        _state += 1;
                      });
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
