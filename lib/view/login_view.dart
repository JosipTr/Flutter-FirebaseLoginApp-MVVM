import 'package:flutter/material.dart';
import 'package:flutter_login_app_mvvm/view/assets/strings/strings.dart';
import 'package:flutter_login_app_mvvm/widgets/my_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyTextField(Strings.emailHintText,emailController),
      ),
    );
  }
}