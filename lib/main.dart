import 'package:flutter/material.dart';
import 'package:provider/app/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var darkTheme;
    return MaterialApp(
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
