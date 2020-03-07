import 'package:Matchfox/firebase/database.dart';
import 'package:Matchfox/widgets/setCard.dart';
import 'package:flutter/material.dart';

class BracketView extends StatefulWidget {
  final Bracket bracket;
  BracketView(this.bracket);

  @override
  _BracketViewState createState() => _BracketViewState(bracket);
}

class _BracketViewState extends State<BracketView> {
  Bracket bracket;
  _BracketViewState(this.bracket);
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
    List<Tab> tabs = [];
    List<ListView> viewCards = [];
    TabBarView view = TabBarView(
      children: viewCards,
    );

    _populateTabs() {

      for(int i = 0; i <= matches.last.stage; i++) {
        tabs.add(Tab(child: Text('Stage ' + (i+1).toString()),));
      }

      int currentStage = 0;
      List<Widget> children = [];
      ListView list = ListView(
        children: children,
      );
      
      for(Match match in matches) {
        if(match.stage > currentStage) {
          currentStage++;
          viewCards.add(list);
          children = [];
        }
        children.add(SetCard(match));
      }
    }

    _populateTabs();

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(bracket.name),
          centerTitle: true,
          bottom: TabBar(tabs: tabs),
        ),
        body: Container(
          child: view,
        ),
      )
    );
  }
}