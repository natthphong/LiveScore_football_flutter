import 'package:flutter/material.dart';
import 'package:grocery/Widget/LoginWidget/tabBar.dart';

import '../API/ApiContoller.dart';
import '../API/ClassApi/Math.dart';
import '../Widget/Pagebody.dart';
import '../Widget/buttom.dart';

class shop extends StatefulWidget {
  const shop({Key? key}) : super(key: key);

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
    dataMath   = await ApiContoller.getData();
    setState(()  {
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
      body: Container(
          color: Colors.grey[200],
            child: active?PageBody(dataMath):Center(child: CircularProgressIndicator(),)
            ,
      )

      ,bottomNavigationBar: buttom(),
    );
  }
}
