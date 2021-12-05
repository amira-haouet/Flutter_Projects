import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lastapp2308/shared/loading.dart';

class Test extends StatelessWidget {
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
  String nomProduit, CracterstiqueProd;
  double ProduitPrice;
  int idProd;

  getnomProduit(name) {
    this.nomProduit = name;
  }

  getidProd(id) {
    this.idProd = int.parse(id);
  }

  getCracterstiqueProd(CractID) {
    this.CracterstiqueProd = CractID;
  }

  getProduitPrice(price) {
    this.ProduitPrice = double.parse(price);
  }

  createData() {
    DocumentReference documentReference =
        Firestore.instance.collection("Produits").document(nomProduit);

    // create Map
    Map<String, dynamic> Produits = {
      "nomProduit": nomProduit,
      "idProd": idProd,
      "CracterstiqueProd": CracterstiqueProd,
      "ProduitPrice": ProduitPrice
    };

    documentReference.setData(Produits).whenComplete(() {
      print("$nomProduit created");
    });
  }

  readData() {
    DocumentReference documentReference =
        Firestore.instance.collection("Produits").document(nomProduit);

    documentReference.get().then((datasnapshot) {
      print(datasnapshot.data["nomProduit"]);
      print(datasnapshot.data["idProd"]);
      print(datasnapshot.data["CracterstiqueProd"]);
      print(datasnapshot.data["ProduitPrice"]);
    });
  }

  updateData() {
    DocumentReference documentReference =
        Firestore.instance.collection("Produits").document(nomProduit);

    // create Map
    Map<String, dynamic> Produits = {
      "nomProduit": nomProduit,
      "idProd": idProd,
      "CracterstiqueProd": CracterstiqueProd,
      "ProduitPrice": ProduitPrice
    };

    documentReference.setData(Produits).whenComplete(() {
      print("$nomProduit updated");
    });
  }

  deleteData() {
    DocumentReference documentReference =
        Firestore.instance.collection("Produits").document(nomProduit);

    documentReference.delete().whenComplete(() {
      print("$nomProduit deleted");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.yellow[600],
          title: Text("Materials"),
        ),
        body: SingleChildScrollView(
          child: Padding(
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
                                BorderSide(color: Colors.orange, width: 2.0))),
                    onChanged: (String name) {
                      getnomProduit(name);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Appareil ID",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 2.0))),
                    onChanged: (String id) {
                      getidProd(id);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Cracteristique",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 2.0))),
                    onChanged: (String CractID) {
                      getCracterstiqueProd(CractID);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Reference",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 2.0))),
                    onChanged: (String price) {
                      getProduitPrice(price);
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
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Text("Read"),
                      textColor: Colors.white,
                      onPressed: () {
                        readData();
                      },
                    ),
                    RaisedButton(
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Text("Update"),
                      textColor: Colors.white,
                      onPressed: () {
                        updateData();
                      },
                    ),
                    Expanded(
                        child: RaisedButton(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Text("Delete"),
                      textColor: Colors.white,
                      onPressed: () {
                        deleteData();
                      },
                    ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      Expanded(
                        child: Text("Label "),
                      ),
                      Expanded(
                        child: Text("Material ID"),
                      ),
                      Expanded(
                        child: Text("Cracteristique"),
                      ),
                      Expanded(
                        child: Text("Reference"),
                      )
                    ],
                  ),
                ),
                StreamBuilder(
                  stream: Firestore.instance.collection("Produits").snapshots(),
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
                                  child: Text(documentSnapshot["nomProduit"]),
                                ),
                                Expanded(
                                  child: Text(
                                      documentSnapshot["idProd"].toString()),
                                ),
                                Expanded(
                                  child: Text(
                                      documentSnapshot["CracterstiqueProd"]),
                                ),
                                Expanded(
                                  child: Text(documentSnapshot["ProduitREF"]
                                      .toString()),
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
        ));
  }
}
