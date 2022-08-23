import 'package:flutter/material.dart';
import 'package:foodyspot/pages/loginScreen.dart';
import 'package:foodyspot/pages/homeScreen.dart';
import 'package:foodyspot/pages/splash.dart';
import 'package:foodyspot/pages/register.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
      routes: {
        "/home": (context) => Home(),
        "/login": (context) => Login(),
        "/register":(context) => Register()
  },
  ));
}



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState(); 
}

class _MyAppState extends State<MyApp> {

 
  @override
  Widget build(BuildContext context) {
    
    
    return Splash();
  }
  
}

