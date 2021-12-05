import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_navigation/screens/PageRoutes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: PageRoutes().routeMaker(),
      initialRoute: PageRoutes.screen1_page,
    );
  }
}
