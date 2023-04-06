import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/home/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff081b25),
      ),
      home: MyHomePage(),
    );
  }
}
