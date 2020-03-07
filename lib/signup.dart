import 'package:Matchfox/firebase/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  var _email = '';
  var _password = '';
  String errorText = '';

  void initState() {
    super.initState();
    // Org("").getBrackets();
    Bracket("55730440-6051-11ea-baec-070c925f546e").getMatches().then((matches){errorText = matches.toString();});
  }

  void checkSignup(BuildContext context) async {
    _formKey.currentState.save();
    FirebaseUser _user;
    await _auth
        .createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        )
        .then((auth) => _user = auth.user)
        .catchError((e) {
      setState(() {
        if (e is PlatformException) {
          switch (e.code) {
            case 'ERROR_EMAIL_ALREADY_IN_USE':
              errorText = 'Email is already used';
              break;
            default:
              errorText = e.code;
          }
        }
      });
    });
    if (_user != null) {
      Navigator.pushReplacementNamed(context, "setup");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
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
                child: Text('Sign up'),
                onPressed: () => checkSignup(context),
              ),
              Text(errorText, style: TextStyle(color: Colors.red),),
            ],
          ),
        ),
      ),
    );
  }
}