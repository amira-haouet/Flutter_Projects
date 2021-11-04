import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lastapp2308/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference geecCollection =
      Firestore.instance.collection('geecs');

  Future<void> updateUserData(
      String firstname, String lastname, int age) async {
    return await geecCollection.document(uid).setData({
      'firstname': firstname,
      'lastname': lastname,
      'age': age,
    });
  }

  // get brews stream
  Stream<QuerySnapshot> get geecs {
    return geecCollection.snapshots();
  }
}
