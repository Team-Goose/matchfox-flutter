import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  FirebaseUser _user;
  String _email = '';
  String _password = '';
  String errorText = '';

  void checkLogin(BuildContext context) async {
    _formKey.currentState.save();
    await _auth
          .signInWithEmailAndPassword(email: _email, password: _password)
          .then((auth) => _user = auth.user)
          .catchError((e) {
      setState(() {
        if (e is PlatformException) {
          switch (e.code) {
            case 'ERROR_WRONG_PASSWORD':
            case 'ERROR_USER_NOT_FOUND':
              errorText = 'Invalid email or password';
              break;
            default:
              errorText = e.code;
          }
        }
      });
    });
    if (_user != null) {
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, 'home');
      });
      print("signed in " + _user.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                onSaved: (text) => _email = text,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                onSaved: (text) => _password = text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              RaisedButton(
                child: Text('Log in'),
                onPressed: () => checkLogin(context)
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
        ),
      ),
    );
  }
}