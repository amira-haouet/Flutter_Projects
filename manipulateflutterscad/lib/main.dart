import 'package:flutter/material.dart';
import 'package:manipulateflutterscad/screens/basic_screen.dart';

void main() => runApp(StaticApp());

class StaticApp extends StatelessWidget {
    const StaticApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: false;
    return MaterialApp(
      home: BasicScreen(),
    );
  }
}
