import 'package:Matchfox/home.dart';
import 'package:Matchfox/loginSignup.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matchfox',
      theme: _theme(),
      home: Main(),
      routes: <String, WidgetBuilder> {
        'loginsignup': (BuildContext context) => LoginSignup(),
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
    return LoginSignup();
  }
}