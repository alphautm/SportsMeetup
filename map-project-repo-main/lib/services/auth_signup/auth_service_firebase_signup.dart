import '../../app/dependencies.dart';
import '../../models/user.dart' as a;
import '../rest.dart';
import 'auth_service_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
/*
class AuthServiceFirebaseSignup implements AuthServiceSignup {
  RestService get rest => dependency();
  // var usersData = FirebaseFirestore.instance.collection('users').snapshots();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  void _storeNewFirebaseUser(uid, email, password) async {
    await users
        .add({
          'id': uid,
          'login': uid, // John Doe
          'name': email,
          'email': email,
          'password': password,
          'photoUrl': password // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

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

  Future<a.User> signUp({String email, String password}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = result.user;

      //await
      _storeNewFirebaseUser(user.uid, user.email, password);

      //await
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }
}*/
