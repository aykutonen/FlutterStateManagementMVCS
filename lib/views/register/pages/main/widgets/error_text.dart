import 'package:flutter/cupertino.dart';

class ErrorText extends StatelessWidget {
  final String text;

  const ErrorText({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12.0,
            color: CupertinoColors.systemRed,
          ),
        ),
      ),
    );
  }
}
