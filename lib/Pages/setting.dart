import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/Pages/League.dart';

import 'Login.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("SETTING"),) , backgroundColor:  Colors.black,),
        body:  Container(
          color: Colors.grey,
          child: Column(
            children: [
              Expanded(  child: Center(child: Container(color: Colors.black , child: InkWell( onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaguePage()));}, child: Text("BACK" , style: TextStyle(color: Colors.white , fontSize:  20),)))))
              ,
              Expanded(
                child: InkWell(  onTap: (){setState((){
                    try{
                        FirebaseAuth.instance.signOut();
                    }catch(e){
                      print(e);
                    }
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));


                });}, child: Center(child: Container( color : Colors.black, child: Text("LOGOUT" , style: TextStyle(color: Colors.white , fontSize:  20))))),
              ),

            ],
          ),
        ),

    );
  }
}
