import 'package:flutter/material.dart';

import '../API/ClassApi/Math.dart';

Widget matchTile(Math match) {
  var homeGoal = match.match_hometeam_score;
  var awayGoal = match.match_awayteam_score;
  if (homeGoal == null) homeGoal = 0;
  if (awayGoal == null) awayGoal = 0;

  return Container(
    margin: EdgeInsets.symmetric(vertical: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            match.match_hometeam_name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.0,
            ),
          ),
        ),
        Image.network(
          match.team_home_badge,
          width: 20,
        ),
        Expanded(
          child: Text(
            "${homeGoal} - ${awayGoal}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ),
        Image.network(
          match.team_away_badge,
          width: 20,
        ),
        Expanded(
          child: Text(
            match.match_awayteam_name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.0,
            ),
          ),
        ),
      ],
    ),
  );
}