import 'package:flutter/material.dart';
import 'package:flutter_login_app_mvvm/view/login_view.dart';

class MyStreamBuilder extends StatefulWidget {
  const MyStreamBuilder({Key? key}) : super(key: key);

  @override
  State<MyStreamBuilder> createState() => _MyStreamBuilderState();
}

class _MyStreamBuilderState extends State<MyStreamBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        return const LoginView();
      },
    );
  }
}