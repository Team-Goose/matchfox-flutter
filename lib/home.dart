import 'package:Matchfox/bracketPage.dart';
import 'package:Matchfox/landing.dart';
import 'package:Matchfox/profilePage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String title = 'Home';
  Widget page = Landing();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: PageStorage(
        child: page,
        bucket: PageStorageBucket(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                print('home');
                title = 'Home';
                page = Landing();
              }
            ),
            IconButton(
              icon: Icon(Icons.apps),
              onPressed: () {
                print('brackets');
                title = 'Brackets';
                page = BracketPage();
              }
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                print('profile');
                title = 'Profile';
                page = ProfilePage();
              }
            ),
          ],
        ),
      ),
    );
  }
}