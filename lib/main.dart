import 'package:flutter/material.dart';
import 'package:saib_ui/screens/landing_page.dart';
import 'package:saib_ui/screens/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
              fontWeight: FontWeight.normal),
          bodyText2: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
              fontWeight: FontWeight.normal),
          headline1: TextStyle(
              fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
          headline2: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
          headline3: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.normal,
              color: Colors.white),
          headline6: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.normal,
              color: Colors.black),
        ),
      ),
      routes: {
        '/': (context) => const LandingPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
