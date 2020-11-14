import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterResultTitle extends StatelessWidget {
  final String text;
  const RegisterResultTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline4,
      textAlign: TextAlign.center,
    );
  }
}
