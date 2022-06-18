import 'package:flutter/material.dart';
import 'package:flutter_login_app_mvvm/view/assets/strings/strings.dart';
import 'package:flutter_login_app_mvvm/widgets/my_elevated_button.dart';
import 'package:flutter_login_app_mvvm/widgets/my_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();

//   @override
// void initState() {
//   super.initState();

//   // Start listening to changes.
//   emailController.addListener(_printValue);
// }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _printValue() {
    print("This is output: ${emailController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(Strings.emailHintText, emailController),
            MyElevatedButton(Strings.loginButtonText, _printValue)
          ],
        ),
      ),
    );
  }
}