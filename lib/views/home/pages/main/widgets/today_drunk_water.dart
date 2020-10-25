import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';
import 'package:StateManagementMVCS/models/user_model.dart';
import 'package:StateManagementMVCS/views/home/pages/main/widgets/info_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodayDrunkWater extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var totalAmount = context.select<UserModel, int>((e) => e.dailyTotalDrunk);
    var unit = context.select<AppModel, Unit>((e) => e.unit);

    return InfoBox(
      title: 'Bugün İçilen',
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            "${totalAmount.toString()} ${unit.name}",
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ],
    );
  }
}
