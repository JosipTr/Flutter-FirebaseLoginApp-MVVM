import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthModel {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future logIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Stream<User?> stateChanges() {
    return _firebaseAuth.authStateChanges();
  }

  Future register(String email, String password) async {
    try {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
