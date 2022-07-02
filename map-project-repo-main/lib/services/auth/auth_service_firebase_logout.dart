import '../../app/dependencies.dart';
import '../../models/user.dart' as a;
import '../rest.dart';
import 'auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServiceFirebase {
  RestService get rest => dependency();
  final FirebaseAuth _firebaseAuth;
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();
  AuthServiceFirebase(this._firebaseAuth);
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
