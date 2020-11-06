import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';
import 'package:StateManagementMVCS/views/home/pages/main/widgets/info_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeastWaterBox extends StatelessWidget {
  final int totalAmount;

  const LeastWaterBox({@required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    // var totalAmount = context.select<UserModel, int>((e) => e.dailyTotalDrunk);
    var targetAmount = context.select<AppModel, int>((e) => e.targetAmount);
    var leastAmount = targetAmount - totalAmount;
    var leastAmountText =
        leastAmount < 0 ? "+${leastAmount * -1}" : "$leastAmount";

    var unit = context.select<AppModel, Unit>((e) => e.unit);

    return InfoBox(
      title: 'Günlük Hedef',
      marginLeft: 10.0,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                "$leastAmountText ${unit.name}",
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            Text(
              "of $targetAmount ${unit.name}",
              style: TextStyle(fontSize: 16.0),
            )
          ],
        ),
      ],
    );
  }
}
