import 'package:flutter/material.dart';
import 'package:grocery/API/ApiContoller.dart';
import 'package:grocery/Pages/shop.dart';

import '../API/ClassApi/League.dart';
import '../Widget/League/League_body.dart';
import '../Widget/LoginWidget/tabBar.dart';
import '../Widget/barDate.dart';
import '../Widget/buttom.dart';

class LeaguePage extends StatefulWidget {
  const LeaguePage({Key? key}) : super(key: key);

  @override
  State<LeaguePage> createState() => _LeagueState();
}

class _LeagueState extends State<LeaguePage> {
  List<League> listleague = [];
  bool active = false;
  var date = DateTime.now();
  var day;
  var month;
  bool delay = false;

  void daychange(int D, int M) async {
    print('day');
    setState((){delay = true;});
    print(delay);
    await Future.delayed(const Duration(seconds: 1),(){
      setState(() {

        day = D;
        month = M;
      });
    });
        delay = false;
    print(delay);
  }

  void next(var LeagueId) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => shop(
                  L_id: LeagueId,
                  day: day,
                  month: month,
                )));
  }

  void initState() {
    day = date.day;
    month = date.month;
    fetch();
    super.initState();
  }

  void fetch() async {
    listleague = await ApiContoller.getLeague();

    setState(() {
      active = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: tabBar(),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: delay?Center(child: CircularProgressIndicator()):Container(
          color: Colors.white,
          child: active
              ? body_League(listleague, next, daychange)
              : Center(
                  child: CircularProgressIndicator(),
                )),
      bottomNavigationBar: buttom(),
    );
  }
}
