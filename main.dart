import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Screens/home.dart';
import 'Screens/login.dart';
import 'Screens/reg.dart';
import 'Screens/liveterminal.dart';
void main() {
WidgetsFlutterBinding.ensureInitialized();
Firebase.initializeApp(); 

 runApp(
   

      MaterialApp(
  theme: ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    accentColor: Colors.black,

    // Define the default font family.
    fontFamily: 'Yu Mincho',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.normal),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Yu Mincho'),
    ),
  )
,

    initialRoute: "/",
    routes:{
     // "/": (context )=>MyTerminal(),
      "/": (context )=>Myhome(),
      "/reg":(context )=> Myreg(),
      "/login":(context )=>Mylogin(),
    "/terminal":(context )=> MyTerminal(),
    } ,
  
     darkTheme: ThemeData.dark(),
    // theme:ThemeData.light(),
    debugShowCheckedModeBanner: false,
  )
  );
}

