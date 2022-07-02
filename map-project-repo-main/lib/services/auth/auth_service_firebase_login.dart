import '../../app/dependencies.dart';
import '../../models/user.dart' as a;
import '../rest.dart';
import 'auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
/*
class AuthServiceFirebase implements AuthService {
  RestService get rest => dependency();
  // var usersData = FirebaseFirestore.instance.collection('users').snapshots();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<a.User> _userFromFirebaseUser(User user) async {
    a.User newUser;

    // return user != null ? a.User(login: user.uid) : null;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').get().then(
        (QuerySnapshot querySnapshot) {
          for (int i = 0; i < querySnapshot.docs.length; i++) {
            if (user.uid == querySnapshot.docs[i]['id']) {
              //  print(querySnapshot.docs[i]["photoUrl"]);
              newUser = new a.User(
                id: querySnapshot.docs[i]['id'],
                login: querySnapshot.docs[i]['login'],
                name: querySnapshot.docs[i]['name'],
                photoUrl: querySnapshot.docs[i]['photoUrl'],
              );
            }
          }
        },
      );
      return newUser;
    } else {
      return null;
    }
  }

  Future<a.User> authenticate({String email, String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<String> signUp({String login, String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: login, password: password);
      return "Sign up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}*/
