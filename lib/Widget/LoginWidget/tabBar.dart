import 'package:flutter/material.dart';

Widget tabBar() {
  return Container(
    margin: EdgeInsets.only(left: 10 , right: 10 ),
    child: Row(
      children: [
        Expanded(
          child: Container(
            child: Row(
              children: [
                Icon(Icons.sports_soccer_outlined,size: 35,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Football',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),

                Icon(Icons.filter_list,size: 15,),


              ],
            ),
          ),
        )
        ,
            Row(children: [Icon(Icons.search_outlined,size: 20,) ,  SizedBox(width: 16,),Icon(Icons.settings,size: 20,) ],)
        ],
    ),
  );
}
