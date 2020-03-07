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
          MaterialButton(
            child: Text('Login'),
            onPressed: () {
              if(true) {
                // Success
                Navigator.pushReplacementNamed(context, 'home');
              } /* else {
                // Failure

              } */
            }
          ),

          Text(errorText),
        ],
      ),
    );
  }
}