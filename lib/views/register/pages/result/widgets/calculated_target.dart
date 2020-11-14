import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterResultCalculatedTarget extends StatelessWidget {
  final String text;
  const RegisterResultCalculatedTarget(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
