import 'package:Matchfox/home.dart';
import 'package:Matchfox/login.dart';
import 'package:Matchfox/signup.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _theme(),
      home: Login(),
      routes: <String, WidgetBuilder> {
        'login': (BuildContext context) => Login(),
        'signup': (BuildContext context) => Signup(),
        'home': (BuildContext context) => Home(),
      },
    );
  }
}

ThemeData _theme() {
  return ThemeData(
    brightness: Brightness.dark,
  );
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Login();
  }
}