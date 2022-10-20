import 'package:flutter/material.dart';

import '../API/ClassApi/Math.dart';

Widget matchTile(Math match, Function callback) {
  var homeGoal = match.match_hometeam_score;
  var awayGoal = match.match_awayteam_score;

  if (homeGoal == "") homeGoal = 0;
  if (awayGoal == "") awayGoal = 0;

  return Container(
    margin: EdgeInsets.symmetric(vertical: 12.0),
    child: InkWell(
      onTap: () {
        callback(match);
      },
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
          FadeInImage(
            image: NetworkImage(match.team_home_badge),
            placeholder: AssetImage("assets/loading.png"),
            imageErrorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.sports_soccer,
                size: 30,
              );
            },
            width: 20,
            fit: BoxFit.fitWidth,
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
          FadeInImage(
            image: NetworkImage(match.team_away_badge),
            placeholder: AssetImage("assets/loading.png"),
            imageErrorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.sports_soccer,
                size: 30,
              );
            },
            width: 20,
            fit: BoxFit.fitWidth,
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
    ),
  );
}
