import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lastapp2308/shared/loading.dart';

class Test extends StatelessWidget {
  @override
  bool loading = false;
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
    
        body: MyApp(),
        
      
    );
  }
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String studentName, studentID, studyProgramID;
  double studentGPA;

  getStudentName(name) {
    this.studentName = name;
  }

  getStudentID(id) {
    this.studentID = id;
  }

  getStudyProgramID(programID) {
    this.studyProgramID = programID;
  }

  getStudentGPA(gpa) {
    this.studentGPA = double.parse(gpa);
  }

  createData() {
    DocumentReference documentReference =
        Firestore.instance.collection("MyStudents").document(studentName);

    // create Map
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentID,
      "studyProgramID": studyProgramID,
      "studentGPA": studentGPA
    };

    documentReference.setData(students).whenComplete(() {
      print("$studentName created");
    });
  }

  readData() {
    DocumentReference documentReference =
        Firestore.instance.collection("MyStudents").document(studentName);

    documentReference.get().then((datasnapshot) {
      print(datasnapshot.data["studentName"]);
      print(datasnapshot.data["studentID"]);
      print(datasnapshot.data["studyProgramID"]);
      print(datasnapshot.data["studentGPA"]);
    });
  }

  updateData() {
    DocumentReference documentReference =
        Firestore.instance.collection("MyStudents").document(studentName);

    // create Map
    Map<String, dynamic> students = {
      "studentName": studentName,
      "studentID": studentID,
      "studyProgramID": studyProgramID,
      "studentGPA": studentGPA
    };

    documentReference.setData(students).whenComplete(() {
      print("$studentName updated");
    });
  }

  deleteData() {
    DocumentReference documentReference =
        Firestore.instance.collection("MyStudents").document(studentName);

    documentReference.delete().whenComplete(() {
      print("$studentName deleted");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Flutter College"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Name",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String name) {
                  getStudentName(name);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Student ID",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String id) {
                  getStudentID(id);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Study Program ID",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String programID) {
                  getStudyProgramID(programID);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "GPA",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String gpa) {
                  getStudentGPA(gpa);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
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
                RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("Read"),
                  textColor: Colors.white,
                  onPressed: () {
                    readData();
                  },
                ),
                RaisedButton(
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("Update"),
                  textColor: Colors.white,
                  onPressed: () {
                    updateData();
                  },
                ),
                RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("Delete"),
                  textColor: Colors.white,
                  onPressed: () {
                    deleteData();
                  },
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Expanded(
                    child: Text("Name"),
                  ),
                  Expanded(
                    child: Text("Student ID"),
                  ),
                  Expanded(
                    child: Text("Program ID"),
                  ),
                  Expanded(
                    child: Text("GPA"),
                  )
                ],
              ),
            ),
            StreamBuilder(
              stream: Firestore.instance.collection("MyStudents").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data.documents[index];
                        return Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(documentSnapshot["studentName"]),
                            ),
                            Expanded(
                              child: Text(documentSnapshot["studentID"]),
                            ),
                            Expanded(
                              child: Text(documentSnapshot["studyProgramID"]),
                            ),
                            Expanded(
                              child: Text(
                                  documentSnapshot["studentGPA"].toString()),
                            )
                          ],
                        );
                      });
                } else {
                  return Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
