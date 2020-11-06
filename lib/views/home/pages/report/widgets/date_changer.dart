import 'package:StateManagementMVCS/commands/report_command.dart';
import 'package:StateManagementMVCS/constants.dart';
import 'package:StateManagementMVCS/models/report_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DateChanger extends StatelessWidget {
  void _changeCurrentDateHandler({bool isBack = true}) async {
    ReportCommand().changeCurrentDate(isBack);
    await ReportCommand().load();
  }

  @override
  Widget build(BuildContext context) {
    var currentDate =
        context.select<ReportModel, DateTime>((e) => e.currentDate);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CupertinoButton(
          child: Icon(
            Icons.arrow_left,
            size: 35.0,
          ),
          onPressed: () => _changeCurrentDateHandler(),
        ),
        Text(
          dtformat.format(currentDate),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
        CupertinoButton(
          child: Icon(
            Icons.arrow_right,
            size: 35.0,
          ),
          onPressed: () => _changeCurrentDateHandler(isBack: false),
        ),
      ],
    );
  }
}
