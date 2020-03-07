import 'package:Matchfox/firebase/database.dart';
import 'package:Matchfox/home.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

class SetupUser extends StatefulWidget {
  @override
  _SetupUserState createState() => _SetupUserState();
}

class _SetupUserState extends State<SetupUser> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';

  void pushNextWidget() {
    Navigator.pushReplacementNamed(context, 'home');
  }

  void checkSubmit(BuildContext context) async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    await Member("BEnXp4rf0rruqnfLdMZn").setUsername(_username);
    
    Future.delayed(Duration.zero, () {
      pushNextWidget();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set up'),
        centerTitle: true,
      ),
      body: Container(
        child: Form(
            key: _formKey,
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Text(Member("BEnXp4rf0rruqnfLdMZn").id),
                TextFormField(
                  onSaved: (text) => _username = text,
                  validator: (text) {
                    if (text == '' || text.contains(' ')) {
                      return 'Input a username without spaces';
                    } else {
                      return null;
                    }
                  } ,
                  decoration: InputDecoration(
                      labelText: 'Username',
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.0),
                  child: RaisedButton(
                    child: Text('Submit'),
                    clipBehavior: Clip.antiAlias,
                    onPressed: () => checkSubmit(context),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}