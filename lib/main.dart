import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_app_mvvm/view/login_view.dart';
import 'package:flutter_login_app_mvvm/viewmodel/firebase_viewmodel.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseAuthViewModel = FirebaseAuthViewModel();
    return MaterialApp(
      home: StreamBuilder(
        stream: firebaseAuthViewModel.stateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Scaffold();
          } else {
            return const LoginView();
          }
        },
      ),
    );
  }
}
