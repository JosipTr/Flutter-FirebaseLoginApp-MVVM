import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController _textEditingController;
  final String _hintText;

  const MyTextField(this._hintText, this._textEditingController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      style: const TextStyle(color: Colors.blue),
      decoration: InputDecoration(
        hintText: _hintText,
      ),
    );
  }
}