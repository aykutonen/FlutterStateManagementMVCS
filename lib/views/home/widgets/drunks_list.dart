import 'package:StateManagementMVCS/models/drunk_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:easy_localization/easy_localization.dart';

class DrunkList extends StatelessWidget {
  final double height;
  final List<DrunkModel> drunks;
  const DrunkList({this.height = 150.0, @required this.drunks});

  static final DateFormat dtformat = DateFormat('dd.MM.yyyy HH:mm');

  @override
  Widget build(BuildContext context) {
    return drunks == null || drunks.isEmpty
        ? Center(child: Text('no_records').tr())
        : Material(
            color: Colors.transparent,
            child: ListView.builder(
              itemCount: drunks.length,
              physics: PageScrollPhysics(),
              shrinkWrap: true,
              reverse: true,
              itemBuilder: (context, i) {
                return ListTile(
                  visualDensity: VisualDensity(vertical: -4.0),
                  contentPadding: EdgeInsets.all(0),
                  title: Text(
                      '${drunks[i].amount.toString()} ${drunks[i].unit.name}'),
                  subtitle: Text(
                    dtformat.format(drunks[i].createDate) +
                        " | " +
                        dtformat.format(drunks[i].trackDate),
                  ),
                );
              },
            ),
          );
  }
}
