import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class MyEmailTextFormField extends StatelessWidget {
  final TextEditingController _textEditingController;
  final String _hintText;
  final String _text;

  const MyEmailTextFormField(this._hintText, this._textEditingController, this._text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (email) =>
          email != null && !EmailValidator.validate(email)
              ? _text
              : null,
      controller: _textEditingController,
      style: const TextStyle(color: Colors.blue),
      decoration: InputDecoration(
        hintText: _hintText,
      ),
    );
  }
}

class MyPasswordTextFormField extends StatelessWidget {
  final TextEditingController _textEditingController;
  final String _hintText;
  final String _text;

  const MyPasswordTextFormField(this._hintText, this._textEditingController, this._text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) =>
          value != null && value.length < 6
              ? _text
              : null,
      controller: _textEditingController,
      style: const TextStyle(color: Colors.blue),
      decoration: InputDecoration(
        hintText: _hintText,
      ),
    );
  }
}
