import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ncert3/HomePage%20Widget/HomePage.dart';
import 'package:ncert3/PDF%20Widget/DownloadPDF.dart';
import 'package:provider/provider.dart';

import 'Theme widget/ThemeData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
      });
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.cyan,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/book4.jpg',
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "WELCOME TO NCERT COURSE",
                  style: TextStyle(fontSize: 18),
                )
              ],
            )));
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
