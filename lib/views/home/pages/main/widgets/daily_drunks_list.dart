import 'package:StateManagementMVCS/models/drunk_model.dart';
import 'package:StateManagementMVCS/models/user_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DailyDrunkList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<DrunkModel> drunks =
        context.select<UserModel, List<DrunkModel>>((e) => e.dailyDrunks);
    drunks.sort((a, b) => a.createDate.isAfter(b.createDate) ? 0 : 1);

    return Material(
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
              DateFormat("HH:mm").format(drunks[i].createDate),
            ),
          );
        },
      ),
    );
  }
}
