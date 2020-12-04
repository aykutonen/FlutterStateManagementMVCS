import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';
import 'package:StateManagementMVCS/views/home/pages/main/widgets/info_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class DrunkWaterBox extends StatelessWidget {
  final int totalAmount;

  const DrunkWaterBox({@required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    var unit = context.select<AppModel, Unit>((e) => e.unit);

    return InfoBox(
      title: 'today_drunk'.tr(),
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
