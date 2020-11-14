import 'package:flutter/cupertino.dart';

class RegisterBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Icon(CupertinoIcons.back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
