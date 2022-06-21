import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_app_mvvm/resources/firebase_auth_model.dart';

class FirebaseAuthViewModel {
  final FirebaseAuthModel _firebaseAuthModel = FirebaseAuthModel();

  Future logIn(String email, String password) async {
    await _firebaseAuthModel.logIn(email, password);
  }

  Stream<User?> stateChanges() {
    return _firebaseAuthModel.stateChanges();
  }

  Future register(String email, String password) async {
    await _firebaseAuthModel.register(email, password);
  }
}
