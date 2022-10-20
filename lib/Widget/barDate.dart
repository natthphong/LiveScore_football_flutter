import 'package:flutter/material.dart';

Widget bar_Date(Function callback) {
  var date = DateTime.now();
  var day = [];
  var month = [];
  for (var i = 7; i >= 0; i--) {
    var newDate = new DateTime(date.year, date.month, date.day - i);
    int M = newDate.month;
    int D = newDate.day;
    day.add(D);
    month.add(M);
  }
  for (var i = 1; i < 8; i++) {
    var newDate = new DateTime(date.year, date.month, date.day + i);
    int M = newDate.month;
    int D = newDate.day;
    day.add(D);
    month.add(M);
  }


  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
      child: Row(
          children: [
            cardDay(day[0],month[0],callback),
            cardDay(day[1],month[1],callback),
            cardDay(day[2],month[2],callback),
            cardDay(day[3],month[3],callback),
            cardDay(day[4],month[4],callback),
            cardDay(day[5],month[5],callback),
            cardDay(day[6],month[6],callback),
            cardDay(day[7],month[7],callback),
            cardDay(day[8],month[8],callback),
            cardDay(day[9],month[9],callback),
            cardDay(day[10],month[10],callback),
            cardDay(day[11],month[11],callback),
            cardDay(day[12],month[12],callback),
            cardDay(day[13],month[13],callback),


          ],
      ),
  );
}

Widget cardDay(int day , int month ,Function callback){
    return InkWell(
          onTap: (){callback(day,month);},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(child: Text("${day}.${month}")),
      ),
    );
}
