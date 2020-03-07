import 'package:cloud_functions/cloud_functions.dart';
import 'dart:async';

class Database {
  static Future<List<Org>> getOrgs() {
    HttpsCallable callable = CloudFunctions.instance
        .getHttpsCallable(functionName: 'getOrgs')
          ..timeout = const Duration(seconds: 30);
    Future<HttpsCallableResult> result = callable.call();

    var completer = new Completer<List<Org>>();
    result.then((result) {
      List<String> strList = result.data as List<String>;
      List<Org> orgList = strList.map((s) =>  new Org(s)).toList();
      completer.complete(orgList);
    });

    return completer.future;
  }
}

class Org {
  String id;
  Org(this.id);
  
  Future<List<Bracket>> getBrackets() {
    HttpsCallable callable = CloudFunctions.instance
        .getHttpsCallable(functionName: 'getBrackets')
          ..timeout = const Duration(seconds: 30);
    Future<HttpsCallableResult> result = callable.call(
      <String, dynamic>{
        'orgId': id
      }
    );

    var completer = new Completer<List<Bracket>>();
    result.then((result) {
      List<dynamic> strList = result.data as List<dynamic>;
      List<Bracket> bracketsList = strList.map((d) => Bracket(d['id'], d['name'])).toList();
      completer.complete(bracketsList);
    });

    return completer.future;
  }
}

class Bracket {
  String id;
  String name;
  Bracket(this.id, this.name);
  Bracket.withId(this.id);

  Future<String> getName() {
    HttpsCallable callable = CloudFunctions.instance
        .getHttpsCallable(functionName: 'getBracket')
          ..timeout = const Duration(seconds: 30);
    Future<HttpsCallableResult> result = callable.call(
      <String, dynamic>{
        'bracketID': id
      }
    );


  }

  Future<List<Match>> getMatches() {
    HttpsCallable callable = CloudFunctions.instance
        .getHttpsCallable(functionName: 'getMatches')
          ..timeout = const Duration(seconds: 30);
    Future<HttpsCallableResult> result = callable.call(
      <String, dynamic>{
        'bracketID': id
      }
    );

    var completer = new Completer<List<Match>>();
    result.then((result) {
      List<dynamic> strList = result.data['bracket'] as List<dynamic>;
      int i = 0;
      List<Match> matchList = strList.map((d) {
        List<Member> memList = (d['members'] as List<dynamic>).map((id) => Member(id));
        List<int> scoreList = (d['score'] as List<dynamic>).map((s) => s as int);
        return Match(++i, memList, scoreList, d['nextMatch'], d['stage']);
      }).toList();
      completer.complete(matchList);
    });

    return completer.future;
  }
  void register(String userID) {}
}

class Match {
  int id;
  List<Member> members;
  List<int> score;
  int nextMatch;
  int stage;
  Match(this.id, this.members, this.score, this.nextMatch, this.stage);

  void reportMatch(int score1, score2) {}
}

class Member {
  String id;
  Member(this.id);

  Future<String> getUsername() {
     HttpsCallable callable = CloudFunctions.instance
        .getHttpsCallable(functionName: 'getUsername')
          ..timeout = const Duration(seconds: 30);
    Future<HttpsCallableResult> result = callable.call(
      <String, dynamic>{
        'userID': id
      }
    );

    var completer = new Completer<String>();
    result.then((result) {
      completer.complete(result.data as String);
    });

    return completer.future;
  }

  Future<HttpsCallableResult> setUsername(String username) {
    HttpsCallable callable = CloudFunctions.instance
        .getHttpsCallable(functionName: 'setUsername')
          ..timeout = const Duration(seconds: 30);
    return callable.call(
      <String, dynamic>{
        'id': id,
        'username': username
      }
    );
  }


}

// OrgID[] getOrgs() {}
// BracketID[] getBrackets(string orgID) {}
//// member[] getMembers(string orgID) {}
//// member[] getAllMembers() {}
// void register(int bracketID,string memberID) {}
// int scan() {} // return bracketID
// bracket getBracket(string bracketID) {}
// void reportMatch(int matchID, int score1, int score2)