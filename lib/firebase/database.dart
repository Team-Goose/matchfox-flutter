import 'package:cloud_functions/cloud_functions.dart';

class Database {
  Future<List<Org>> getOrgs() {}
  Org scan() {}
}

class Org {
  String id;
  
  Future<List<Bracket>> getBrackets() {}
}

class Bracket {
  String id;
  String name;
  List<Match> matches;

  void register(String userID) {}
}

class Match {
  int id;
  List<Member> members;
  int nextMatch;

  void reportMatch(int score1, score2) {}
}

class Member {
  int id;
  String username;
}

// OrgID[] getOrgs() {}
// BracketID[] getBrackets(string orgID) {}
//// member[] getMembers(string orgId) {}
//// member[] getAllMembers() {}
// void register(int bracketID,string memberID) {}
// int scan() {} // return bracketID
// bracket getBracket(string bracketID) {}
// void reportMatch(int matchID, int score1, int score2)