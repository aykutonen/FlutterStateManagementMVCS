import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Greeting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = context.select<AppModel, String>((e) => e.currentUser);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, $user',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
        const Text(
          'Have a nice day!',
          style: TextStyle(
            fontSize: 22.0,
          ),
        ),
      ],
    );
  }
}
