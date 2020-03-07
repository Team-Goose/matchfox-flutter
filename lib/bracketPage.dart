import 'package:Matchfox/firebase/database.dart';
import 'package:Matchfox/widgets/bracketCard.dart';
import 'package:flutter/material.dart';

class BracketPage extends StatefulWidget {
  @override
  _BracketPageState createState() => _BracketPageState();
}

class _BracketPageState extends State<BracketPage> {

  _BracketPageState();

  List<BracketCard> cards = List<BracketCard>();

  setupCards() {
    cards.add(BracketCard(Bracket()));
  }

  @override
  Widget build(BuildContext context) {
    setupCards();
    return Container(
      child: ListView(
        children: cards
      ),
    );
  }
}