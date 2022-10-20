import 'package:flutter/material.dart';

Widget teamStat(String team, String logoUrl, String teamName) {
  return Expanded(
    child: Column(
      children: [
        Text(
          team,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight:  FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Expanded(
          child:
          FadeInImage(
            image: NetworkImage(logoUrl),
            placeholder: AssetImage("assets/loading.png"),
            imageErrorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.sports_soccer,
                size: 60,
              );
            },
            width: 51,
            fit: BoxFit.fitWidth,
          )

        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          teamName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ],
    ),
  );
}