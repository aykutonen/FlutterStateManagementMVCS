import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';
import 'package:StateManagementMVCS/models/user_model.dart';
import 'package:StateManagementMVCS/views/home/widgets/seperator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodayDrunkWater extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var totalAmount = context.select<UserModel, int>((e) => e.dailyTotalDrunk);
    var unit = context.select<AppModel, Unit>((e) => e.unit);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(7.0)),
        border: Border.all(
          style: BorderStyle.solid,
          color: Colors.black26,
          width: 1.0,
        ),
      ),
      padding: EdgeInsets.all(15.0),
      width: 170.0,
      // height: 110.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Bugün İçilen',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${totalAmount.toString()} ${unit.name}",
            style: TextStyle(fontSize: 36.0),
          ),
        ],
      ),
    );
  }
}