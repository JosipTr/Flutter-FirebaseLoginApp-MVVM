import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyRichText extends StatefulWidget {
  final VoidCallback _onClickedSignUp;
  final String _preMessage;
  final String _message;
  
  const MyRichText(this._onClickedSignUp, this._preMessage, this._message, {Key? key}) : super(key: key);

  @override
  State<MyRichText> createState() => _MyRichTextState();
}

class _MyRichTextState extends State<MyRichText> {

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: widget._preMessage,
        style: const TextStyle(color: Colors.blue),
        children: <TextSpan> [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = widget._onClickedSignUp,
            text: widget._message,
            style: const TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.blue,
              fontWeight: FontWeight.bold
            )
          )
        ],
      ),
      );
  }
}