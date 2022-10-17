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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            title: tabBar(),
            backgroundColor: Colors.white,
            elevation: 0,
          )),
      body: Container(
            height:  double.infinity,
        color: Colors.red,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icon2.png',
                    width: 180,
                    height: 240,
                  ),
                  Text(
                    'Shoppern',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  )
                ],
              ),
              login_Widget()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(height: 40, color : Colors.white, child: Row(children: [Text("ติดตามเรา")],),),
    );
  }
}
