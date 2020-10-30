import 'package:StateManagementMVCS/views/home/pages/main/widgets/info_box.dart';
import 'package:StateManagementMVCS/views/home/widgets/big_title.dart';
import 'package:StateManagementMVCS/views/home/widgets/seperator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DateFormat dtformat = DateFormat('dd.MM.yyyy');

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BigTitle(title: 'Report'),
          const Seperator(height: 25.0),
          dateChanger(dtformat),
          Divider(),
          Seperator(height: 25.0),
          dailyInfoBoxes(),
          Seperator(height: 25.0),
          Divider(),
          Seperator(height: 25.0),
          Container(
            height: 150.0,
            // constraints: BoxConstraints.expand(height: double.infinity),
            child: Material(
              color: Colors.transparent,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 15,
                itemBuilder: (context, i) {
                  return ListTile(
                    visualDensity: VisualDensity(vertical: -4.0),
                    contentPadding: EdgeInsets.all(0),
                    title: Text('adsads $i'),
                    subtitle: Text('asdsadda'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row dateChanger(DateFormat dtformat) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CupertinoButton(
          child: Icon(
            Icons.arrow_left,
            size: 35.0,
          ),
          onPressed: () => {},
        ),
        Text(dtformat.format(DateTime.now())),
        CupertinoButton(
          child: Icon(
            Icons.arrow_right,
            size: 35.0,
          ),
          onPressed: () => {},
        ),
      ],
    );
  }

  Row dailyInfoBoxes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoBox(
          title: 'Bugün İçilen',
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                '123 ml',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
          ],
        ),
        InfoBox(
          title: 'Günlük Hedef',
          marginLeft: 10.0,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    '123 ml',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
                Text(
                  'of 1231232 ml',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
