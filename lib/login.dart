import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          TextField(),
          TextField(),
          RaisedButton(
            child: Text('Log in'),
            onPressed: null
          ),
          RaisedButton(
            child: Text('Need an account?'),
            onPressed: () {
              Navigator.pushNamed(context, 'signup');
            }
          ),
        ],
      ),
    );
  }
}