import 'package:flutter/material.dart';
import 'package:lastapp2308/models/user.dart';
import 'package:lastapp2308/screens/authenticate/authenticate.dart';
import 'package:lastapp2308/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
