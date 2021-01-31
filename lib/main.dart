import 'package:flutter/material.dart';
import 'package:viste/screens/Test_Page.dart';
import 'screens/authentication/sign_in.dart';
import 'screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'shared/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final bool _is_online = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primaryColor,
        fontFamily: 'AndikaNB',
        textTheme: TextTheme(
          headline1: TextStyle(
              color: thirdColor,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 1.2
          ),
          headline2: TextStyle(
            color: secondaryColor,
            fontSize: 16.0,
            fontWeight: FontWeight.bold
          ),
          headline3: TextStyle(
            color: thirdColor,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            color: secondaryColor,
            fontSize: 14,
          ) ,
          headline5: TextStyle(
            color: secondaryColor,
            fontSize: 17,
            fontWeight: FontWeight.bold
          ) ,
          headline6: TextStyle(
              color: secondaryColor,
              fontSize: 12,
              fontWeight: FontWeight.bold
          ) ,
          button: TextStyle(
            color: thirdColor,
          ),
        ),
        buttonColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _is_online? HomePage():SignInPage(),
      // home: Testing(),
    );
  }
}
