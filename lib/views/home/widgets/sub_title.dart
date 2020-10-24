import 'package:flutter/cupertino.dart';

class SubTitle extends StatelessWidget {
  final String title;

  const SubTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
      ),
    );
  }
}
