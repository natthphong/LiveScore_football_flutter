import 'package:flutter/material.dart';

import '../../API/ClassApi/League.dart';

Widget Col_League(League L , Function callback) {
  var country = L.country_name;
  if(L.country_name =="intl")  country = "Tournament";
  return InkWell(
    onTap: (){
      callback(L.league_id);
    },
    child: Container(
        decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 2 , color: Colors.grey),
              bottom: BorderSide(width: 2 , color: Colors.grey),
            )

        ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [


            FadeInImage(
              image: NetworkImage(L.league_logo),
              placeholder: AssetImage("assets/loading.png"),
              imageErrorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.stadium,
                  size: 30,
                );
              },
              width: 30,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(width: 12,)
            ,
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(country, style:  TextStyle(fontWeight: FontWeight.w300, fontSize: 12),),
              Text(L.league_name ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),)
            ],)
          ],
        ),
      ),
    ),
  );
}
