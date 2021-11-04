import 'package:flutter/material.dart';
/*

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lastapp2308/shared/loading.dart';

class Contact extends StatelessWidget {
  @override
  bool loading = false;
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: MyApp(),
          );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String  email;
  String commentaire;
  String name;
  int phonenumber;

  getcommentaire(name) {
    this.name = name;
  }

  getphonenumber(phone) {
    this.phonenumber = int.parse(phone);
  }

  getemail(CractID) {
    this.email = CractID;
  }

  getname(commentaire) {
    this.commentaire = commentaire;
  }

  createData() {
    DocumentReference documentReference =
        Firestore.instance.collection("contact").document(commentaire);

    // create Map
    Map<String, dynamic> contact = {
      "commentaire": commentaire,
      "phonenumber": phonenumber,
      "email": email,
      "name": name
    };

    documentReference.setData(contact).whenComplete(() {
      print("$commentaire created");
    });
  }

  readData() {
    DocumentReference documentReference =
        Firestore.instance.collection("contact").document(commentaire);

    documentReference.get().then((datasnapshot) {
      print(datasnapshot.data["commentaire"]);
      print(datasnapshot.data["phonenumber"]);
      print(datasnapshot.data["email"]);
      print(datasnapshot.data["name"]);
    });
  }

  updateData() {
    DocumentReference documentReference =
        Firestore.instance.collection("contact").document(commentaire);

    // create Map
    Map<String, dynamic> contact = {
      "commentaire": commentaire,
      "phonenumber": phonenumber,
      "email": email,
      "name": name
    };

    documentReference.setData(contact).whenComplete(() {
      print("$commentaire updated");
    });
  }

  deleteData() {
    DocumentReference documentReference =
        Firestore.instance.collection("contact").document(commentaire);

    documentReference.delete().whenComplete(() {
      print("$commentaire deleted");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.yellow[600],
          title: Text("Contact Form"),
        ),
        body: SingleChildScrollView(
          child: (Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    controller: n,
                    decoration: InputDecoration(
                        labelText: "Name",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 2.0))),
                    onChanged: (String name) {
                      getname(name);
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Email obilgatoire';
                      }

                      if (!RegExp(
                              r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                          .hasMatch(value)) {
                        return 'Entrer une adresse mail valide !!';
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    controller: p,
                    decoration: InputDecoration(
                        labelText: "Phone number",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 2.0))),
                    onChanged: (String id) {
                      getphonenumber(id);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    controller: e,
                    decoration: InputDecoration(
                        labelText: "email",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 2.0))),
                    onChanged: (String CractID) {
                      getemail(CractID);
                    },
                      validator: (String email) {
                      if (email.isEmpty) {
                        return 'Email obilgatoire';
                      }

                      if (!RegExp(
                              r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                          .hasMatch(email)) {
                        return 'Entrer une adresse mail valide !!';
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    controller: c,
                    decoration: InputDecoration(
                        labelText: "Probleme",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 2.0))),
                    onChanged: (String commentaire) {
                      getcommentaire(commentaire);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: clearTextInput,
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text('Clear'),
                    ),
                    RaisedButton(
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Text("Create"),
                      textColor: Colors.white,
                      onPressed: () {
                        createData();
                      },
                    ),
                  ],
                ),
              ],
            ),
          )),
        ));
  }
}

final c = TextEditingController();
final n = TextEditingController();
final p = TextEditingController();
final e = TextEditingController();
clearTextInput() {
  c.clear();
  n.clear();
  p.clear();
  e.clear();
}
