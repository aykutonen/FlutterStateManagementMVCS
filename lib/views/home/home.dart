import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/models/hour_minute_model.dart';
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
    AppModel model = context.select<AppModel, AppModel>((e) => e);

    String content =
        "Hi, ${model.currentUser}. isFirsttime: ${model.isFirstTime}. Your Language: ${model.language}. ";
    content +=
        "Water Unit: ${model.unit}. Wake up time: ${model.wakingUp.toDisplayString}. Sleeping time: ${model.sleeping.toDisplayString}. ";
    content +=
        "Your target amount: ${model.targetAmount}. Your notification settings: ${model.notification}.";

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Flexible(
            child: Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : Text(
                  content,
                  maxLines: 10,
                ),
        )),
      ),
    );
  }
}
