import 'package:convertingdartmodelsintojson/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 title: 'Test json',
 theme: ThemeData(
 primarySwatch: Colors.green,
 ),
 home: Home(),
 );
 }
}

class Home {
    const Home({Key? key}) : super(key1: key);

}