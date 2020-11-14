import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterResultCaption extends StatelessWidget {
  final String text;

  const RegisterResultCaption(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.caption,
    );
  }
}
