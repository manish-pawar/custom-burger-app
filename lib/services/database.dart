
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/burg.dart';
import 'package:flutter_app/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference

  final CollectionReference burgCollection = Firestore.instance.collection('burgers');

  Future updateUserData(String bun , int sauce ,String cheese, String patty, String name) async {
    return await burgCollection.document(uid).setData({
      'bun': bun,
      'sauce': sauce,
      'cheese': cheese,
      'patty': patty,
      'name': name,
    });
  }

  //burger list from snapshot
  Burg _burgListFromSnapshot(DocumentSnapshot snapshot) {
        return Burg(
          bun: snapshot.data['bun'] ?? '',
          sauce: snapshot.data['sauce'] ?? 0,
          cheese: snapshot.data['cheese'] ?? '',
          patty: snapshot.data['patty'] ?? '',
          name: snapshot.data['name'] ?? '',
        );
  }


  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        bun: snapshot.data['bun'] ?? '',
        sauce: snapshot.data['sauce'] ?? 0,
        cheese: snapshot.data['cheese'] ?? '',
        patty: snapshot.data['patty'] ?? '',
        name: snapshot.data['name'] ?? '',
    );
  }



  //get burgs stream
  Stream<Burg> get burgs {
    return burgCollection.document(uid).snapshots()
      .map(_burgListFromSnapshot);
  }

  //get user doc stream
  // get user doc stream
  Stream<UserData> get userData {
    return burgCollection.document(uid).snapshots()
        .map(_userDataFromSnapshot);
  }


}