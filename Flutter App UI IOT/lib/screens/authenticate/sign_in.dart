import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lastapp2308/services/auth.dart';
import 'package:lastapp2308/shared/constant.dart';
import 'package:lastapp2308/shared/loading.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.yellow[100],
            appBar: AppBar(
              backgroundColor: Colors.yellow[600],
              elevation: 0.0,
              title: Text('Sign in to GEEC'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Register'),
                  onPressed: () => widget.toggleView(),
                ),
              ],
            ),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'email'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        obscureText: true,
                        decoration:
                            textInputDecoration.copyWith(hintText: 'password'),
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                       Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    ),
                      SizedBox(height: 30.0),
                      RaisedButton(
                       // style: kLabel,
                          color: Colors.blue[600],
                          child: Text(
                            'Sign In',
                            
                            style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                          ),
                          
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                  error =
                                      'Could not sign in with those credentials';
                                });
                              }
                            }
                          }),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                     
                      
                      Text(
                        '- OR -',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      
                      
                      SizedBox(height: 20),
                      SizedBox(
                        
                        width: 250,
                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: <Widget>[
Image.asset('assets/google.png',
               height :20,
               width: 20,
),
                              Text(
                                '  Sign up with Google',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          textColor: Colors.black,
                          color: Colors.white,
                          padding: EdgeInsets.all(10),
                          onPressed: () {
                            _googleSignUp();
                          },
                        ),
                      ),
                      
                      /*sign in with google*/
                      /*
 SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: RaisedButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.thumb_up, size: 20),
                    Text(
                      '  Sign up with Facebook',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                textColor: Colors.white,
                color: Colors.blue[900],
                padding: EdgeInsets.all(10),
                onPressed: () {
                  signUpWithFacebook();
                },
              ),
            ),
                    */
                    ],
                  ),
                )));
  }
}

/*
    Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }
*/
/*
  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  @override
  Widget _buildGoogle(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(height: 20),
      SizedBox(
        width: 300,
        child: RaisedButton(
          child: Row(
            children: <Widget>[
              Icon(Icons.toys, size: 20),
              Text(
                '  Sign up with Google',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          textColor: Colors.black,
          color: Colors.white,
          padding: EdgeInsets.all(10),
          onPressed: () {
            _googleSignUp();
          },
        ),
      ),
    ]);
  }
}
*/
//_buildSignInWithText()
// sign in with google
Future _googleSignUp() async {
  try {
    final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['email'],
    );
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);

    return user;
  } catch (e) {
    print(e.message);
  }
}
/*
Future signUpWithFacebook() async{
    try {
      var facebookLogin = new FacebookLogin();
      var result = await facebookLogin.logIn(['email']);

      if(result.status == FacebookLoginStatus.loggedIn) {
        final AuthCredential credential = FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token,

        );
        final FirebaseUser user = (await FirebaseAuth.instance.signInWithCredential(credential)).user;
        print('signed in ' + user.displayName);
        return user;
      }
    }catch (e) {
      print(e.message);
    }
    }
    */
/* 
bool _rememberMe = false;

Widget _buildSignInWithText() {
  return Column(
    children: <Widget>[
      Text(
        '- OR -',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(height: 20.0),
      Text(
        'Sign in with',
        style: kLabelStyle,
      ),
    ],
  );
}
}*/
