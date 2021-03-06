import 'package:StateManagementMVCS/constants.dart';
import 'package:StateManagementMVCS/models/drunk_model.dart';
import 'package:StateManagementMVCS/models/user_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DailyDrunkList extends StatelessWidget {
  final double height;
  const DailyDrunkList({this.height = 150.0});

  @override
  Widget build(BuildContext context) {
    // final DateFormat dtformat = DateFormat('dd.MM.yyyy HH:mm');
    List<DrunkModel> drunks =
        context.select<UserModel, List<DrunkModel>>((e) => e.dailyDrunks);

    return SizedBox(
      height: height,
      child: Material(
        color: Colors.transparent,
        child: ListView.builder(
          itemCount: drunks.length,
          reverse: true,
          itemBuilder: (context, i) {
            return ListTile(
              visualDensity: VisualDensity(vertical: -4.0),
              contentPadding: EdgeInsets.all(0),
              title:
                  Text('${drunks[i].amount.toString()} ${drunks[i].unit.name}'),
              subtitle: Text(
                dtformat.format(drunks[i].createDate) +
                    " | " +
                    dtformat.format(drunks[i].trackDate),
              ),
            );
          },
        ),
      ),
    );
  }
}
