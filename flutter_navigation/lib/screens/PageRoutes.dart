import 'package:flutter/material.dart';
import 'package:flutter_navigation/screens/Screen1.dart';
import 'package:flutter_navigation/screens/Screen2.dart';

class PageRoutes {
  static String screen1_page = "screen1";
  static String screen2_page = "screen2";
  Map<String, WidgetBuilder> routeMaker() {
    return {
      screen1_page: (context) => Screen1(),
      screen2_page: (context) => Screen2(),
    };
  }
}
