import '../../app/dependencies.dart';
import '../../models/user.dart' as user;
import '../rest.dart';
import 'auth_service_signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServiceSignupFirebaseToken implements AuthServiceSignup {
  RestService get rest => dependency();

  CollectionReference addUser = FirebaseFirestore.instance.collection('users');
  void _storeNewFirebaseUser(uid, name, email, password, photoUrl) async {
    print("inside store");
    await addUser
        .doc(uid)
        .set({
          'id': uid,
          'name': name,
          'email': email,
          'password': password,
          'photoUrl': photoUrl
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<user.User> signUp(
      {String email, String password, String username}) async {
    try {
      final json = await rest.post('auths/signup', data: {
        'email': email,
        'password': password,
      });

      if (json == null) return null;

      // Pre-process json data to comply with the field of the User model
      json['email'] = json['email'];
      json['id'] = json['localId'];
      json['name'] = json['displayName'];
      json['photoUrl'] = json['profilePicture'];

      _storeNewFirebaseUser(json['localId'], username, json['email'], password,
          json['profilePicture']);
      // Get the access token and let the rest object stores that
      rest.openSession(json['idToken']);

      final _user = user.User.fromJson(json);
      return _user;
    } catch (e) {
      return null;
    }
  }

  Future<void> signout() async => rest.closeSession();
}
