import 'package:flutter/material.dart';
import 'package:grocery/API/ClassApi/cards.dart';
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
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Container(

                        color: Colors.grey,
                    child: Center(
                        child: Text(
                      '${M.match_stadium}',
                      style: TextStyle(
                          fontSize: M.match_stadium.length < 50 ? 18 : 12,
                          color: Colors.black),
                    )),
                  ),
                ),
                if (M.math_detail.length > 0)
                  Expanded(
                    flex: 5,
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
                Container(

                      color: Colors.grey,

                  child: Center(
                      child: Text(
                        'Card',
                        style: TextStyle(
                            fontSize: M.match_stadium.length < 50 ? 18 : 12,
                            color: Colors.black),
                      )),
                ),
                if (M.card.length > 0)
                  Expanded(
                    flex: 2,
                      child: ListView.builder(
                          itemCount: M.card.length,
                          itemBuilder: (Context, index) {
                            return card(M.card[index],
                                M.card[index].home_fault != "" ? true : false);
                          })),

                if(M.card.length<=0)
                    Center(child: Text("NO CARD THIS GAME"),)
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
    padding: const EdgeInsets.only(top: 8, bottom: 8),
    child: Row(

      mainAxisAlignment:  a,
      children: [
        if (active)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${M.score} ', style: TextStyle(fontSize: 14)),
              Row(
                children: [
                  Text(
                    "${M.time}'",
                    style: TextStyle(fontSize: 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Icon(
                      Icons.sports_soccer_outlined,
                      size: 20,
                    ),
                  ),
                  Text(
                    "${M.home_assist}. ${M.home_scorer}",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              )
            ],
          ),
        if (!active)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text('${M.score} ', style: TextStyle(fontSize: 14)),
                ],
              ),
              Row(

                children: [
                  Text(
                    "${M.time}'",
                    style: TextStyle(fontSize: 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Icon(
                      Icons.sports_soccer_outlined,
                      size: 20,
                    ),
                  ),
                  Text(
                    "${M.away_assist}. ${M.away_scorer}",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              )
            ],
          ),
      ],
    ),
  );
}

Widget card(cards C, bool active) {
  var colorchange;
  if(C.card.toString() =="yellow card"){
    colorchange = Colors.yellow;
  }else{
    print(C.card);
    colorchange = Colors.red;
  }
  var a;
  if (active) {
    a = MainAxisAlignment.start;
  } else {
    a = MainAxisAlignment.end;
  }

  return Padding(
    padding: const EdgeInsets.only(top: 16.0),
    child: Row(
      mainAxisAlignment: a,

          children: [
              if(active)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("${C.time}' ")  , Padding(
                  padding: const EdgeInsets.only(left: 8.0 , right: 8.0),
                  child: Icon(Icons.sd_card_alert, size: 20, color: colorchange),

                )
                ,
                  Text('${C.home_fault}')
                ],)
            ,
            if(!active)
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('${C.away_fault}'),
                    Padding(
                  padding: const EdgeInsets.only(left: 8.0 , right: 8.0),
                  child: Icon(Icons.sd_card_alert  , size: 20, color: colorchange),

                )
                  ,
                  Text("${C.time}' ")

                ],)
          ],


    ),
  );
}
