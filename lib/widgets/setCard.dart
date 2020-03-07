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
        Text(match.id.toString()),
        Text(match.members[0].toString() + ' vs. ' + match.members[1].toString()),
        Text(match.score[0].toString() + '-' + match.score[1].toString()),
      ],),
    );
  }
}