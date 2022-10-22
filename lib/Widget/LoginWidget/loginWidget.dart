import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_core/firebase_core.dart';


import '../../Pages/League.dart';


class login_Widget extends StatefulWidget {
  const login_Widget({Key? key}) : super(key: key);

  @override
  State<login_Widget> createState() => _login_WidgetState();
}



class _login_WidgetState extends State<login_Widget> {
  bool register = false;
  var _Username = TextEditingController();
  var _Password = TextEditingController();
  var _Password_Confirm = TextEditingController();
  final fromkey = GlobalKey<_login_WidgetState>();
   final Future<FirebaseApp> filebase = Firebase.initializeApp();

  void login() async {

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _Username.text, password: _Password.text

      ).then((value){
        _Username.clear();
        _Password.clear();
        Fluttertoast.showToast(msg: "Login สำเร็จ");
          Navigator.push(context, MaterialPageRoute(builder: (context){return LeaguePage();}));
      });


    }on FirebaseAuthException catch(e){
        Fluttertoast.showToast(msg: "Login ไม่สำเร็จ \n${e.message}");

    }

  }

  Future<void> register_() async {
    String message="";
    if(_Password_Confirm.text!=_Password.text){
      message = "Password ไม่เหมือนกัน";
        Fluttertoast.showToast(msg: message ,gravity: ToastGravity.CENTER , timeInSecForIosWeb: 5, fontSize: 20);
        setState((){
          _Username.clear();
          _Password.clear();
          _Password_Confirm.clear();
          register = true;});
        return;
      }


    try {
     await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _Username.text, password: _Password.text);
      message = "register สำเร็จ";
    }on FirebaseAuthException catch (e) {

        if(e.message == "The email address is already in use by another account."){
          message = "Email นี้ถูกใช้ไปแล้ว";
        }
        if(e.message == "Password should be at least 6 characters."){
          message = "Password มีความยาวน้อยกว่า 6ตัวอักษร";
        }
        if(e.message == "The email address is badly formatted."){
          message = "กรุณากรอก Email";
        }

    }
    Fluttertoast.showToast(msg: message ,gravity: ToastGravity.CENTER , timeInSecForIosWeb: 5, fontSize: 20);
    setState((){
      _Username.clear();
      _Password.clear();
      _Password_Confirm.clear();
      register = false;});



  }

  @override
  Widget build(BuildContext context) {
          return FutureBuilder(future: filebase,builder: (context , snapshot){
              if(snapshot.hasError){
                return Container(child: Center(child: Text("${snapshot.error}" ,style: TextStyle(fontSize:  30 , color: Colors.black),),),);
              }
              if(snapshot.connectionState == ConnectionState.done){
                return Container(
                  margin: EdgeInsets.only(left: 40, right: 40, top: 100),
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: fromkey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          register
                              ? Text(
                                  'สมัครสมาชิก',
                                  style: TextStyle(fontWeight: FontWeight.bold ),
                                )
                              : Text(
                                  'เข้าสู่ระบบ',
                                  style: TextStyle(fontWeight: FontWeight.bold ),
                                ),
                          TextFormField(
                            controller: _Username,
                            validator: RequiredValidator(errorText: "กรุณาใส่ Email"),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Email',
                            ),

                          ),
                          TextFormField(
                            controller: _Password,
                            validator: RequiredValidator(errorText: "กรุณาใส่ Password"),
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Password',
                            ),
                          ),
                          if(register)
                          TextFormField(
                            controller: _Password_Confirm,
                            validator: RequiredValidator(errorText: "Confirm Password"),
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Confirm Password',
                            ),
                          ),

                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {

                                    register ? register_() : login();
                                  },
                                  style: ElevatedButton.styleFrom(primary: Colors.grey[200]),
                                  child: register
                                      ? Text('สมัครสมาชิก',
                                          style:
                                              TextStyle(color: Colors.black, fontSize: 25))
                                      : Text('เข้าสู่ระบบ',
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 25))),
                              SizedBox(
                                width: 16,
                              ),
                              if (!register)
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        register = true;
                                        _Password.clear();
                                        _Username.clear();
                                      });
                                    },
                                    child: Text('สมัครสมาชิก' , style: TextStyle(color: Colors.blue , fontWeight: FontWeight.w300),) ,),
                              if (register)
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        register = false;
                                        _Password.clear();
                                        _Username.clear();
                                        _Password_Confirm.clear();
                                      });
                                    },
                                    child: Text('เข้าสู่ระบบ',style: TextStyle(color: Colors.blue , fontWeight: FontWeight.w300))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );

              }
              return Container(child: Center(child: Text("Firebase Connection Fail" ,style: TextStyle(fontSize:  30 , color: Colors.black),),),);
          });
    

  }
}




