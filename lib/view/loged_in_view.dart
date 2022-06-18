import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_app_mvvm/widgets/my_elevated_button.dart';

class LogedInView extends StatelessWidget {
  const LogedInView({Key? key}) : super(key: key);

signOut() {
  FirebaseAuth.instance.signOut();
}

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You are loged in like: "),
            Text(user.email!),
            MyElevatedButton("signout", signOut)
          ],
        )),
      ),
    );
  }
}
