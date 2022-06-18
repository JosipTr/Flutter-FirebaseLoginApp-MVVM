import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthModel {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future logIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Stream<User?> stateChanges() {
    return _firebaseAuth.authStateChanges();
  }
}