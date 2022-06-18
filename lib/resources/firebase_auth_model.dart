import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthModel {
  final _firebaseAuthModel = FirebaseAuth.instance;

  Future logIn(String email, String password) async {
    await _firebaseAuthModel.signInWithEmailAndPassword(email: email, password: password);
  }
}