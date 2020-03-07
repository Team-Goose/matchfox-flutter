import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _theme(),
      home: _home(),
    );
  }
}

Widget _home() {
  return Main();
}

ThemeData _theme() {
  return ThemeData(
    brightness: Brightness.dark,
  );
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();

  static String getTitle() {
    return _MainState._title;
  }

  static setTitle(String title) {
    _MainState._title = title;
  }

  static Widget getLeading() {
    return _MainState._leading;
  }

  static setLeading(Widget leading) {
    _MainState._leading = leading;
  }

  static Container getBody() {
    return _MainState._body;
  }

  static setBody(Container body) {
    _MainState._body = body;
  }
}

class _MainState extends State<Main> {
  static String _title = 'Matchfox';
  static Widget _leading;
  static Container _body;

  static String getTitle() {
    return _title;
  }

  static setTitle(String title) {
    _title = title;
  }

  static Widget getLeading() {
    return _leading;
  }

  static setLeading(Widget leading) {
    _leading = leading;
  }

  static Container getBody() {
    return _body;
  }

  static setBody(Container body) {
    _body = body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text(_title),
      centerTitle: true,

      leading: _leading,
    ),

    body: _body,
    
  );
  }
}