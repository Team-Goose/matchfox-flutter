import 'package:Matchfox/firebase/database.dart';
import 'package:flutter/material.dart';

class SetCard extends StatefulWidget {
  Match match;
  SetCard(match);

  @override
  _SetCardState createState() => _SetCardState(match);
}

class _SetCardState extends State<SetCard> {
  Match match;
  _SetCardState(match);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: <Widget>[
        Text('Set 1'),
        Text('player 1 vs player 2'),
        Text('Score 1-2')
      ],),
    );
  }
}