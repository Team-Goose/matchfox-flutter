import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          TextField(),
          TextField(),
          RaisedButton(
            child: Text('Sign up'),
            onPressed: () {
              if (true /* add login checking */) {
                // login success
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, 'setup');
              } else {
                // login fail
                errorText = 'Login failed';
              }
            },
          ),
          Text(errorText, style: TextStyle(color: Colors.red),),
        ],
      ),
    );
  }
}