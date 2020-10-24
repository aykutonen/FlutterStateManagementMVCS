import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Seperator extends StatelessWidget {
  final double height;

  const Seperator({this.height = 50.0});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.transparent,
      height: height,
    );
  }
}
