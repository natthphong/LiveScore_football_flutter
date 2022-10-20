import 'package:flutter/material.dart';
import 'package:grocery/Widget/LoginWidget/tabBar.dart';

import '../API/ApiContoller.dart';
import '../API/ClassApi/Math.dart';
import '../Widget/Pagebody.dart';
import '../Widget/buttom.dart';
import 'detail_macth.dart';

class shop extends StatefulWidget {
  var L_id;
  var day;
  var month;
   shop({Key? key , required this.L_id , required this.day , required this.month}) : super(key: key);

  @override
  State<shop> createState() => _shopState();
}

class _shopState extends State<shop> {
  List<Math> dataMath = [];
  bool active =false;


  void initState()  {
    super.initState();
    fetch();

  }

  void fetch() async{

  dataMath   = await ApiContoller.getData(widget.L_id,widget.day,widget.month);

    setState(()  {
        if(dataMath[0].match_id==-1){
          active = false;
        }else{
          active = true;
        }

    });

  }
  void detail(Math m){
   
          Navigator.push(context, MaterialPageRoute(builder: (context) =>detail_Macth(M:m)));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: tabBar(),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
          color: Colors.grey[200],
            child:
            active&&dataMath.length>0?PageBody(dataMath ,detail):dataMath.length<=0?Center(child: CircularProgressIndicator(),):
            Center(child: Text("NOT MATCH TO DAY"),)

            ,
      )

      ,bottomNavigationBar: buttom(),
    );
  }
}
