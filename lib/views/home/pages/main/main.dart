import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/views/home/pages/main/widgets/add_drunk_water.dart';
import 'package:StateManagementMVCS/views/home/pages/main/widgets/daily_drunks_list.dart';
import 'package:StateManagementMVCS/views/home/pages/main/widgets/greeting.dart';
import 'package:StateManagementMVCS/views/home/pages/main/widgets/today_drunk_water.dart';
import 'package:StateManagementMVCS/views/home/pages/main/widgets/today_least_water.dart';
import 'package:StateManagementMVCS/views/home/widgets/seperator.dart';
import 'package:StateManagementMVCS/views/home/widgets/sub_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Greeting(),
            const Seperator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TodayDrunkWater(),
                TodayLeastWater(),
              ],
            ),
            const Seperator(),
            SubTitle(title: 'daily_logs'.tr()),
            const Seperator(height: 20.0),
            DailyDrunkList(),
            const Seperator(),
            SubTitle(title: 'add_drunk_water'.tr()),
            const Seperator(height: 20.0),
            AddDrunkWater(),
          ],
        ),
      ),
    );
  }
}
