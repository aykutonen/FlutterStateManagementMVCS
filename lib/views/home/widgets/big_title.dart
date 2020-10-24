import 'package:flutter/cupertino.dart';

class BigTitle extends StatelessWidget {
  final String title;

  const BigTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
