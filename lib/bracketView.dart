import 'package:Matchfox/firebase/database.dart';
import 'package:flutter/material.dart';

class BracketView extends StatefulWidget {
  final Bracket bracket;
  BracketView(this.bracket);

  @override
  _BracketViewState createState() => _BracketViewState(bracket);
}

class _BracketViewState extends State<BracketView> {
  Bracket bracket;
  _BracketViewState(bracket);
  List<Match> matches;

  @override
  void initState() {
    bracket.getMatches().then((List<Match> matches) => {
      super.setState(() {
        this.matches = matches;
      })
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bracket.name),
        centerTitle: true,
      ),
      body: Container(
        child: Text(bracket.id),
      ),
    );
  }
}