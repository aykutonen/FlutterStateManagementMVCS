import 'package:StateManagementMVCS/models/report_model.dart';
import 'package:StateManagementMVCS/views/home/widgets/drunk_water_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CurrentDrunkWater extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var totalAmount = context.select<ReportModel, int>((e) => e.totalDrunk);
    return DrunkWaterBox(totalAmount: totalAmount);
  }
}
