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
  final passwordController = TextEditingController();

//   @override
// void initState() {
//   super.initState();

//   // Start listening to changes.
//   emailController.addListener(_printValue);
// }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _printValue() {
    print("This is output: ${emailController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: const SizedBox(
                  height: 200,
                  width: 200,
                  child: FlutterLogo(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Text(Strings.welcomeMessage,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: MyTextField(Strings.emailHintText, emailController),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child:
                    MyTextField(Strings.passwordHintText, passwordController),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: MyElevatedButton(Strings.loginButtonText, _printValue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
