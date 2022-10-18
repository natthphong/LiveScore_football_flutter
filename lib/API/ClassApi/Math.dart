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

  Math(
      {required this.match_id, required this.match_date, required this.match_status, required this.match_time,
        required this.match_hometeam_name, required this.match_hometeam_score, required this.match_awayteam_name,
        required this.match_awayteam_score, required this.match_hometeam_halftime_score, required this.match_awayteam_halftime_score,
        required this.match_hometeam_system, required this.match_awayteam_system, required this.match_round, required this.match_stadium,
        required this.team_home_badge  ,required this.team_away_badge ,required this.match_live
      });


  factory Math.Json(Map<dynamic, dynamic> json)
  {
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
      team_away_badge:  json['team_away_badge'],
      team_home_badge:  json['team_home_badge'],
      match_live: json['match_live'],
    );
  }


}