import 'Math_detail.dart';
import 'cards.dart';

class Math {
  var match_id;
  var match_date;
  var match_status;
  var match_time;
  var match_hometeam_name;
  var match_hometeam_score;
  var match_awayteam_name;
  var match_awayteam_score;
  var match_hometeam_halftime_score;
  var match_awayteam_halftime_score;
  var match_hometeam_system;
  var match_awayteam_system;
  var match_stadium;
  var match_round;
  var team_home_badge;
  var team_away_badge;
  var match_live;
  List<Math_detail> math_detail;
  List<cards> card;

  Math({
    required this.match_id,
    required this.match_date,
    required this.match_status,
    required this.match_time,
    required this.match_hometeam_name,
    required this.match_hometeam_score,
    required this.match_awayteam_name,
    required this.match_awayteam_score,
    required this.match_hometeam_halftime_score,
    required this.match_awayteam_halftime_score,
    required this.match_hometeam_system,
    required this.match_awayteam_system,
    required this.match_round,
    required this.match_stadium,
    required this.team_home_badge,
    required this.team_away_badge,
    required this.match_live,
    required this.math_detail,
    required this.card,
  });

  factory Math.Json(Map<dynamic, dynamic> json) {
    List<cards> cardlish = [];
    for (var i in json['cards']) {
      cards c = cards.Json(i);
      cardlish.add(c);
    }

    List<Math_detail> mdlist = [];
    for (var i in json['goalscorer']) {
      Math_detail md = Math_detail.Json(i);
      mdlist.add(md);
    }

    return Math(
        match_id: json['match_id'],
        match_date: json['match_date'],
        match_awayteam_halftime_score: json['match_awayteam_halftime_score'],
        match_awayteam_name: json['match_awayteam_name'],
        match_awayteam_score: json['match_awayteam_score'],
        match_awayteam_system: json['match_awayteam_system'],
        match_hometeam_halftime_score: json['match_hometeam_halftime_score'],
        match_hometeam_name: json['match_hometeam_name'],
        match_hometeam_score: json['match_hometeam_score'],
        match_hometeam_system: json['match_hometeam_system'],
        match_round: json['match_round'],
        match_stadium: json['match_stadium'],
        match_status: json['match_status'],
        match_time: json['match_time'],
        team_away_badge: json['team_away_badge'],
        team_home_badge: json['team_home_badge'],
        match_live: json['match_live'],
        math_detail: mdlist,
        card: cardlish);
  }

  factory Math.nul() {
    List<cards> cardlish = [];
    List<Math_detail> mdlist = [];
    mdlist.add(Math_detail.nul());
    cardlish.add(cards.nul());
    return Math(
        match_id: -1,
        match_date: -1,
        match_status: -1,
        match_time: -1,
        match_hometeam_name: -1,
        match_hometeam_score: -1,
        match_awayteam_name: -1,
        match_awayteam_score: -1,
        match_hometeam_halftime_score: -1,
        match_awayteam_halftime_score: -1,
        match_hometeam_system: -1,
        match_awayteam_system: -1,
        match_round: -1,
        match_stadium: -1,
        team_home_badge: -1,
        team_away_badge: -1,
        match_live: -1,
        math_detail: mdlist,
        card: cardlish);
  }
}
