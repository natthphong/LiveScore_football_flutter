

import 'package:flutter/material.dart';

import '../../API/ClassApi/League.dart';
import '../barDate.dart';
import 'ColumnLeague.dart';

Widget body_League(List<League> L , Function callback , Function Daychange) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children : [

        bar_Date(Daychange)
        ,
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                        color: Colors.yellow[100],
                        child: Text('Favourite Competitions'),
                      ))
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Col_League(L[55],callback),
                              Col_League(L[39],callback),
                              Col_League(L[29],callback),
                              Col_League(L[24],callback),
                              Col_League(L[46],callback),
                              Col_League(L[76],callback),


                            ],
                          ),
                ),
              )

            ],
          ),
        ),
        Expanded(
            flex: 4 ,

            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                          color: Colors.grey ,
                          child: Text('Competitions'),
                        ))
                  ],
                )
                ,
                 Expanded(child: ListView.builder(itemCount: L.length,itemBuilder: (context,index){return Col_League(L[index] , callback);})),
              ],
            ))

      ]


  );
}
