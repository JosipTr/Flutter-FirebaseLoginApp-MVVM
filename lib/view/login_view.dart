import 'package:flutter/material.dart';
import 'package:flutter_login_app_mvvm/assets/strings/strings.dart';
import 'package:flutter_login_app_mvvm/view/register_view.dart';
import 'package:flutter_login_app_mvvm/viewmodel/firebase_viewmodel.dart';
import 'package:flutter_login_app_mvvm/widgets/my_elevated_button.dart';
import 'package:flutter_login_app_mvvm/widgets/my_richtext.dart';
import 'package:flutter_login_app_mvvm/widgets/my_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
    super.dispose();
  }

  // void _printValue() {
  //   print("This is output: ${emailController.text}");
  // }

  Future _logIn() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    await _firebaseAuthViewModel.logIn(email, password);
  }

  void _onClickedSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterView())
    );
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
                child: MyElevatedButton(Strings.loginButtonText, _logIn),
              ),
              MyRichText(_onClickedSignUp, Strings.preRegisterText, Strings.registerText)
            ],
          ),
        ),
      ),
    );
  }
}
