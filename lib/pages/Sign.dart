import 'package:flutter/material.dart';

import 'package:flutter_app/common/global.dart';
import 'package:flutter_app/common/network.dart';
import 'package:flutter_app/models/index.dart';
import 'package:flutter_app/utils/validator.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // 用于登录时将登录按钮 disabled, 防止重复提交
  bool _isLogining = false;
  bool _passwordVisible = false;
  int _autoFocusField = 0;
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _usernameController.text = Global.profile.lastLogin;
    if (_usernameController.text != null &&
        _usernameController.text.isNotEmpty) {
      _autoFocusField = 1;
    }
    super.initState();
  }

  Future<void> _submit(BuildContext context) async {
    if (_isLogining) {
      return;
    }
    setState(() {
      _isLogining = true;
    });
    User user = await Network(context).login(
      _usernameController.text,
      _passwordController.text,
    );
    setState(() {
      _isLogining = false;
    });
    if (user != null) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("登录")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: _autoFocusField == 0,
                  controller: _usernameController,
                  validator: checkUsernameAvailable,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () {
                    node.nextFocus();
                  },
                  decoration: InputDecoration(
                    labelText: "用户名/手机号/邮箱",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                TextFormField(
                  autofocus: _autoFocusField == 1,
                  controller: _passwordController,
                  validator: checkPasswordAvailable,
                  obscureText: !_passwordVisible,
                  textInputAction: TextInputAction.done,
                  onEditingComplete: () {
                    _submit(context);
                  },
                  decoration: InputDecoration(
                    labelText: "密码",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 55.0),
                    child: RaisedButton(
                      color: _isLogining ? Colors.grey : Colors.blue,
                      onPressed: () => _submit(context),
                      textColor: Colors.white,
                      child: Text(_isLogining ? "登录中..." : "登录"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
