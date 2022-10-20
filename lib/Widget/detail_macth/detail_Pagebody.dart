import 'package:flutter/material.dart';
import 'package:grocery/Widget/teamStat.dart';
import '../../API/ClassApi/Math.dart';

import '../../API/ClassApi/Math_detail.dart';
import '../goal.dart';

Widget detail_Pagebody(Math M) {
  return Column(
    children: [
      Expanded(
          flex: 3,
          child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  teamStat("HOME", M.team_home_badge, M.match_hometeam_name),
                  goalStat(M.match_live, M.match_hometeam_score,
                      M.match_awayteam_score),
                  teamStat("AWAY", M.team_away_badge, M.match_awayteam_name),
                ],
              ),
            ),
          )),
      Expanded(
          flex: 5,
          child: Container(
            height: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                      child: Text(
                    '${M.match_stadium}',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black
                        ),
                  )),
                ),
                if (M.math_detail.length > 0)
                  Expanded(
                      child: ListView.builder(
                    itemCount: M.math_detail.length,
                    itemBuilder: (context, index) {
                      return detail(
                          M.math_detail[index],
                          M.math_detail[index].home_scorer != ""
                              ? true
                              : false);
                    },
                  )),
              ],
            ),
          ))
    ],
  );
}

Widget detail(Math_detail M, bool active) {
  var a;
  if (active) {
    a = MainAxisAlignment.start;
  } else {
    a = MainAxisAlignment.end;
  }

  return Padding(
    padding: const EdgeInsets.only(top: 8 , bottom: 8),
    child: Row(
      mainAxisAlignment: a,
      children: [
        if (active)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Time : ${M.time}', style: TextStyle(fontSize: 14)),
              Text(
                "Score : ${M.score} Scorer By ${M.home_scorer}",
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
        if (!active)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Time : ${M.time}', style: TextStyle(fontSize: 14)),
              Text(
                'Score : ${M.score} Scorer By ${M.away_scorer}',
                style: TextStyle(fontSize: 14),
              )
            ],
          )
      ],
    ),
  );
}
