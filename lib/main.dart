import 'package:flutter/material.dart';
import 'package:hello_world/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // debugShowCheckedModeBanner: false,
        title: 'Wisata Bandung',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Oxygen',
        ),
        home: const MainScreen());
  }
}
