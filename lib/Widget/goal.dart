import 'package:flutter/material.dart';

Widget goalStat(var expandedTime, var homeGoal, var awayGoal) {
  var home = homeGoal;
  var away = awayGoal;
  var elapsed = expandedTime;
  if (home == null) home = 0;
  if (away == null) away = 0;
  if (elapsed == null) elapsed = 0;
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "${elapsed}'",
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "${home} - ${away}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
        )
      ],
    ),
  );
}