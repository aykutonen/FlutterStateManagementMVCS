import 'package:StateManagementMVCS/views/home/pages/report/widgets/current_drunk_list.dart';
import 'package:StateManagementMVCS/views/home/pages/report/widgets/current_drunk_water.dart';
import 'package:StateManagementMVCS/views/home/pages/report/widgets/current_least_water.dart';
import 'package:StateManagementMVCS/views/home/pages/report/widgets/date_changer.dart';
import 'package:StateManagementMVCS/views/home/widgets/big_title.dart';
import 'package:StateManagementMVCS/views/home/widgets/seperator.dart';
import 'package:StateManagementMVCS/views/home/widgets/sub_title.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigTitle(title: 'report'.tr()),
          const Seperator(height: 25.0),
          DateChanger(),
          Divider(),
          Seperator(height: 25.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CurrentDrunkWater(),
              CurrentLeastDrunkWater(),
            ],
          ),
          const Seperator(height: 20.0),
          Divider(),
          const Seperator(height: 15.0),
          SubTitle(title: 'daily_logs'.tr()),
          const Seperator(height: 10.0),
          CurrentDrunkList(),
        ],
      ),
    );
  }
}
