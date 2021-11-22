import 'package:flutter/material.dart';

import 'login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
          accentColor: Colors.orange,
          primarySwatch: Colors.blue
      ),
      home: LoginScreen(),
    );
  }
}

