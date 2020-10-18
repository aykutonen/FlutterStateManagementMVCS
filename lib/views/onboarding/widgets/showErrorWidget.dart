import 'package:flutter/cupertino.dart';

class ShowErrorWidget extends StatelessWidget {
  final String errorText;

  const ShowErrorWidget({this.errorText = ""});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
        top: 20,
      ),
      child: Text(
        errorText,
        style: const TextStyle(
          color: CupertinoColors.destructiveRed,
        ),
      ),
    );
  }
}
