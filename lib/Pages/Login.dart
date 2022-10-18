import 'package:flutter/material.dart';
import 'package:grocery/Widget/LoginWidget/tabBar.dart';

import '../Widget/LoginWidget/loginWidget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: tabBar(),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(

            height:  double.infinity,
        color: Colors.grey[200],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top : 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/flash.png',
                      width: 100,
                      height: 240,
                    ),
                  SizedBox(width: 24,)
            ,
                    Text(
                      'ScoreFlash',
                      style: TextStyle(color: Colors.black, fontSize: 40),
                    )
                  ],
                ),
              ),
              login_Widget()
            ],
          ),
        ),
      ),
    );
  }
}
