import 'package:StateManagementMVCS/views/register/pages/main/register_main.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: RegisterMain(),
          ),
        ),
      ),
    );
  }
}
