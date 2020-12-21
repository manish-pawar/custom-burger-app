import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase User
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid): null ;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  }

  //Sign in anoo
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password

  Future signInWithEmailAndPass(String email, String password) async {
    try{
      AuthResult result =  await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //register with email and pass
  Future registerWithEmailAndPass(String email, String password) async {
    try{
      AuthResult result =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      //create a new doc  for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData('normal', 100, 'normal', 'normal', 'burger choice');
      return _userFromFirebaseUser(user);
    }catch(e){
        print(e.toString());
        return null;
    }
  }


  //sign out

  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}


