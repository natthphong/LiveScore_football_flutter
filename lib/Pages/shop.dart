import 'package:flutter/material.dart';
import 'package:grocery/Widget/LoginWidget/tabBar.dart';

class shop extends StatefulWidget {
  const shop({Key? key}) : super(key: key);

  @override
  State<shop> createState() => _shopState();
}

class _shopState extends State<shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            title: tabBar(text: "Menu"),
            backgroundColor: Colors.white,
            elevation: 0,
          )),
    );
  }
}
