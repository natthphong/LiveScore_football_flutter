import 'package:flutter/material.dart';
import 'package:grocery/Widget/buttom.dart';

import '../API/ClassApi/Math.dart';
import '../Widget/LoginWidget/tabBar.dart';
import '../Widget/detail_macth/detail_Pagebody.dart';
class detail_Macth extends StatefulWidget {
  final Math M;
  const detail_Macth({Key? key , required this.M}) : super(key: key);

  @override
  State<detail_Macth> createState() => _detail_MacthState();
}

class _detail_MacthState extends State<detail_Macth> {
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
            child: detail_Pagebody(widget.M)
              ,
        ),

      bottomNavigationBar: buttom(),
    );
  }
}
