import 'package:flutter/material.dart'
    show BuildContext, MaterialApp, StatelessWidget, Widget, runApp;
import 'package:lastapp2308/services/auth.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'screens/wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root+ of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}

/*

import 'package:flutter/material.dart';
import 'package:lastapp2308/services/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int thememode = 1;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  starting()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(pref.getInt("thememode")!=null ){
      thememode = pref.getInt("thememode");
    }else{
      pref.setInt("thememode", thememode );
    }
    setState(() {

    });

  }
  toggletheme()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(pref.getInt("thememode")==1 ){
      pref.setInt("thememode", 0 );
      thememode = 0;
    }else{
      pref.setInt("thememode", 1 );
      thememode = 1;
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(togglecall: toggletheme,),
      theme: ThemeData(
        primaryColor: Colors.blue,
        cardColor: Colors.lightBlueAccent
      ),
      darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.black45,
          cardColor: Colors.black87
      ),
      themeMode: thememode==1? ThemeMode.dark:ThemeMode.light,
    );
  }
}*/
