import 'package:StateManagementMVCS/models/app_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Flexible(
            child: Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : Text(
                  'Hi, ${context.select<AppModel, String>((e) => e.currentUser)}'),
        )),
      ),
    );
  }
}
