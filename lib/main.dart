import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:translate_application/home_page.dart';
import 'package:translate_application/login_page.dart';
import 'package:get/get.dart';
import 'package:translate_application/signup_page.dart';
import 'package:translate_application/test.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home_page',
      routes: {
        'home_page':(context) => MyHomePage(),
        'signup_page':(context) => SignUp(),
        'login_page':(context) => LoginPage(),
      },
    );
  }
}

