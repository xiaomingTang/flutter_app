import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final String title;

  SplashScreen({this.title});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(context) {
    return Container(
      child: Image(
        image: AssetImage("assets/images/splash.jpg"),
        fit: BoxFit.fill,
      ),
    );
  }
}
