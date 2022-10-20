import 'package:flutter/material.dart';
import 'package:grocery/Widget/teamStat.dart';

import '../API/ClassApi/Math.dart';
import 'goal.dart';
import 'matchTile.dart';


Widget PageBody(List<Math> allmatches , Function callback) {
  return Column(
    children: [
      Expanded(
        flex: 2,
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                teamStat("HOME", allmatches[0].team_home_badge,
                    allmatches[0].match_hometeam_name),
                goalStat(allmatches[0].match_date, //ผิดเงื่อนไขอะไรไม่รู้
                    allmatches[0].match_hometeam_score, allmatches[0].match_awayteam_score),
                teamStat("AWAY", allmatches[0].team_away_badge,
                    allmatches[0].match_awayteam_name),
              ],
            ),
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white70,
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "MATCHES",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: allmatches.length,
                    itemBuilder: (context, index) {
                      return matchTile(allmatches[index] , callback);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}



