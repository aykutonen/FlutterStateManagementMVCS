import 'package:StateManagementMVCS/models/drunk_model.dart';
import 'package:StateManagementMVCS/models/report_model.dart';
import 'package:StateManagementMVCS/views/home/widgets/drunks_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CurrentDrunkList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var drunks = context.select<ReportModel, List<DrunkModel>>((e) => e.drunks);
    return DrunkList(drunks: drunks);
  }
}
