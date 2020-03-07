import 'package:flutter/material.dart';

class SetCard extends StatefulWidget {
  @override
  _SetCardState createState() => _SetCardState();
}

class _SetCardState extends State<SetCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: <Widget>[
        Text('player 1 vs player 2'),
        
      ],),
    );
  }
}