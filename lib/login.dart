import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String errorText = '';

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
            onPressed: () {
              if (true /* add login checking */) {
                // login success
                Navigator.pushReplacementNamed(context, 'home');
              } else {
                // login fail
                errorText = 'Login failed';
              }
            }
          ),
          RaisedButton(
            child: Text('Need an account?'),
            onPressed: () {
              Navigator.pushNamed(context, 'signup');
            }
          ),
          Text(errorText, style: TextStyle(color: Colors.red),),
        ],
      ),
    );
  }
}