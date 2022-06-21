import 'package:flutter/material.dart';
import 'package:flutter_login_app_mvvm/assets/strings/strings.dart';
import 'package:flutter_login_app_mvvm/main.dart';
import 'package:flutter_login_app_mvvm/viewmodel/firebase_viewmodel.dart';
import 'package:flutter_login_app_mvvm/widgets/my_elevated_button.dart';
import 'package:flutter_login_app_mvvm/widgets/my_richtext.dart';
import 'package:flutter_login_app_mvvm/widgets/my_textfield.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firebaseAuthViewModel = FirebaseAuthViewModel();

//   @override
// void initState() {
//   super.initState();

//   // Start listening to changes.
//   emailController.addListener(_printValue);
// }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // void _printValue() {
  //   print("This is output: ${emailController.text}");
  // }

  Future _register() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confirmedPassword = _confirmPasswordController.text.trim();

    if (password != confirmedPassword) {
      const snackBar = SnackBar(content: Text("Passwords doesn't match!"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      await _firebaseAuthViewModel.register(email, password);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  void _onClickedSignUp() {
    Navigator.pop(context);
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
                child: MyTextField(Strings.emailHintText, _emailController),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child:
                    MyTextField(Strings.passwordHintText, _passwordController),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: MyTextField(
                    Strings.confirmPassHintText, _confirmPasswordController),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: MyElevatedButton(Strings.registerText, _register),
              ),
              MyRichText(_onClickedSignUp, Strings.preLogInText,
                  Strings.loginButtonText)
            ],
          ),
        ),
      ),
    );
  }
}
