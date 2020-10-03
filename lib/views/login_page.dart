import 'package:StateManagementMVCS/commands/login_command.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  void _handleLoginPressed() async {
    setState(() => _isLoading = true);
    bool success = await LoginCommand().run("someuser", "somepass");
    if (!success) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: _isLoading
        ? CircularProgressIndicator()
        : FlatButton(
          child: Text('Login'),
          onPressed: _handleLoginPressed,
        )
      ),
    );
  }
}
