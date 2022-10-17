import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery/Pages/Login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCR1m5cm3i6q5bFisIfrz4wj8k3TSFavGk",
      appId: "com.example.grocery",
      messagingSenderId: "1082851808227",
      projectId: "shoppern-5d2c8",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GROCERY',
      theme: ThemeData(
      ),
      home: const Login(),
    );
  }
}
