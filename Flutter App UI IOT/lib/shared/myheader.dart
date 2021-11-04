import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lastapp2308/models/user.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  /*
FirebaseUser currentUser;



  void _loadCurrentUser() {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
    
     
      setState(() { // call setState to rebuild the view
        currentUser = user;
      });
    });
  }

  String _email() {
    if (currentUser != null) {
      return currentUser.email;
    } else {
      return "no current user";
    }
  }



*/
  final FirebaseAuth _auth = FirebaseAuth.instance;
  getCurrentUser() async {
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    // Similarly we can get email as well
    final uemail = user.email;
    // print(uid);
    print(uemail);
    return uemail;
  }

  String getemail() {
    if (getCurrentUser() != null) {
      //return getCurrentUser().toString();
      return 'there is user';
    } else {
      return 'no user';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[700],
      width: double.infinity,
      height: 400,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                //Width:10,
                image: AssetImage(
                  'assets/images.png',
                  //width:10,
                ),
              ),
            ),
          ),
          Text(
            "Connected",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            getemail(),
            
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
