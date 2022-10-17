import 'package:flutter/material.dart';

Widget tabBar({String text = "เข้าสู่ระบบ"}) {
  return Container(
    margin: EdgeInsets.only(left: 10 , right: 10 , top:24),
    child: Row(

      children: [

        Expanded(
          child: Container(

            child: Row(
              children: [
                Image.asset(
                  'assets/icon1.png',
                  width: 30,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Shoppern',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$text',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                )
                ,
              ],
            ),
          ),
        )
        ,
            Text('ขอความช่วยเหลือ?' , style: TextStyle(fontSize: 15, color: Colors.redAccent),)
        ],
    ),
  );
}
