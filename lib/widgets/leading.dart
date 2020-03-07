import 'package:Matchfox/main.dart';
import 'package:flutter/material.dart';

class Leading extends StatefulWidget {
  Widget backTo;
  
  Leading(this.backTo)

  @override
  _LeadingState createState() => _LeadingState();
}

class _LeadingState extends State<Leading> {
  Widget backTo;

  _LeadingState(this.backTo);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        setState(() {
          Main.setBody(backTo);
        });
      },
    );
  }
}