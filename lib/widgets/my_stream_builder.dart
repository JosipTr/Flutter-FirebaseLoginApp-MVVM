import 'package:flutter/material.dart';
import 'package:flutter_login_app_mvvm/view/loged_in_view.dart';
import 'package:flutter_login_app_mvvm/view/login_view.dart';
import 'package:flutter_login_app_mvvm/viewmodel/firebase_viewmodel.dart';

class LoginStreamBuilder extends StatelessWidget {
  const LoginStreamBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseViewModel = FirebaseAuthViewModel();
    return StreamBuilder(
      stream: firebaseViewModel.stateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error"));
        }
        if (snapshot.hasData) {
          return const LogedInView();
        } else {
          return const LoginView();
        }
      }
    );
  }
}