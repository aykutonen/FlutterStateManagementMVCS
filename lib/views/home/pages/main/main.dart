import 'package:StateManagementMVCS/views/home/pages/main/widgets/add_drunk_water.dart';
import 'package:StateManagementMVCS/views/home/pages/main/widgets/daily_drunks_list.dart';
import 'package:StateManagementMVCS/views/home/pages/main/widgets/greeting.dart';
import 'package:StateManagementMVCS/views/home/pages/main/widgets/today_drunk_water.dart';
import 'package:StateManagementMVCS/views/home/pages/main/widgets/today_least_water.dart';
import 'package:StateManagementMVCS/views/home/widgets/seperator.dart';
import 'package:StateManagementMVCS/views/home/widgets/sub_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Greeting(),
            Seperator(),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TodayDrunkWater(),
                  TodayLeastWater(),
                ],
              ),
            ),
            Seperator(),
            const SubTitle(title: 'Daily Logs'),
            Seperator(height: 20.0),
            Container(
              height: 150.0,
              child: DailyDrunkList(),
            ),
            Seperator(),
            const SubTitle(title: 'Add Drunk Water'),
            Seperator(height: 20.0),
            AddDrunkWater(),
          ],
        ),
      ),
    );
  }
}
