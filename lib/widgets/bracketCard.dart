import 'package:Matchfox/bracketView.dart';
import 'package:Matchfox/firebase/database.dart';
import 'package:flutter/material.dart';

class BracketCard extends StatefulWidget {
  final Bracket bracket;
  BracketCard(this.bracket);

  @override
  _BracketCardState createState() => _BracketCardState(bracket);
}

class _BracketCardState extends State<BracketCard> {
  Bracket bracket;
  _BracketCardState(this.bracket);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(bracket.name),
          MaterialButton(
            child: Text('View'),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return BracketView(bracket);
                  }
                )
              );
            },
          )
        ],
      ),
    );
  }
}