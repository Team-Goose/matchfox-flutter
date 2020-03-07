import 'package:flutter/material.dart';

class LoginSignup extends StatefulWidget {
  @override
  _LoginSignupState createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {

  String title = 'Log In';
  Widget page = Container();

  @override
  Widget build(BuildContext context) {
    Container _login() {
      return Container(
        child: ListView(
          children: <Widget>[
            TextField(),
            TextField(),
            RaisedButton(
              child: Text('Log In'),
              onPressed: () {
                setState(() {
                  _signUp();
                });
              },
            )
          ],
        ),
      );
    }

    Container _signUp() {
      return Container(
        child: ListView(
          children: <Widget>[
            TextField(),
            TextField(),
            RaisedButton(
              child: Text('Sign up'),
              onPressed: () {
                
              },
            ),
            RaisedButton(
              child: Text('Already have an account? Log in!'),
              onPressed: () {
                setState(() {
                  page = _login();
                });
              },
            ),
          ],
        ),
      );
    }

    setState(() {
      page = _login();
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: PageStorage(
        bucket: PageStorageBucket(),
        child: page,
      ),
    );
  }
}