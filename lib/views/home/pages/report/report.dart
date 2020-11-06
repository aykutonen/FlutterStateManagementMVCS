import 'package:StateManagementMVCS/views/home/pages/report/widgets/current_drunk_list.dart';
import 'package:StateManagementMVCS/views/home/pages/report/widgets/current_drunk_water.dart';
import 'package:StateManagementMVCS/views/home/pages/report/widgets/current_least_water.dart';
import 'package:StateManagementMVCS/views/home/pages/report/widgets/date_changer.dart';
import 'package:StateManagementMVCS/views/home/widgets/big_title.dart';
import 'package:StateManagementMVCS/views/home/widgets/seperator.dart';
import 'package:StateManagementMVCS/views/home/widgets/sub_title.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          const BigTitle(title: 'Report'),
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
          const SubTitle(title: 'Daily Logs'),
          const Seperator(height: 10.0),
          CurrentDrunkList(),
        ],
      ),
    );
  }

  // Row dateChanger() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       CupertinoButton(
  //         child: Icon(
  //           Icons.arrow_left,
  //           size: 35.0,
  //         ),
  //         onPressed: () => _changeCurrentDateHandler(),
  //       ),
  //       Text(
  //         dtformat.format(_currentDate),
  //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
  //       ),
  //       CupertinoButton(
  //         child: Icon(
  //           Icons.arrow_right,
  //           size: 35.0,
  //         ),
  //         onPressed: () => _changeCurrentDateHandler(isBack: false),
  //       ),
  //     ],
  //   );
  // }
}

// class ReportPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final DateFormat dtformat = DateFormat('dd.MM.yyyy');

//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const BigTitle(title: 'Report'),
//           const Seperator(height: 25.0),
//           dateChanger(dtformat),
//           Divider(),
//           Seperator(height: 25.0),
//           // dailyInfoBoxes(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TodayDrunkWater(),
//               TodayLeastWater(),
//             ],
//           ),
//           const Seperator(height: 20.0),
//           Divider(),
//           const Seperator(height: 15.0),
//           const SubTitle(title: 'Daily Logs'),
//           const Seperator(height: 10.0),
//           DailyDrunkList(),
//         ],
//       ),
//     );
//   }

//   Row dateChanger(DateFormat dtformat) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         CupertinoButton(
//           child: Icon(
//             Icons.arrow_left,
//             size: 35.0,
//           ),
//           onPressed: () => {},
//         ),
//         Text(dtformat.format(DateTime.now())),
//         CupertinoButton(
//           child: Icon(
//             Icons.arrow_right,
//             size: 35.0,
//           ),
//           onPressed: () => {},
//         ),
//       ],
//     );
//   }

//   Row dailyInfoBoxes() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         InfoBox(
//           title: 'Bugün İçilen',
//           children: [
//             FittedBox(
//               fit: BoxFit.fitWidth,
//               child: Text(
//                 '123 ml',
//                 style: TextStyle(fontSize: 30.0),
//               ),
//             ),
//           ],
//         ),
//         InfoBox(
//           title: 'Günlük Hedef',
//           marginLeft: 10.0,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 FittedBox(
//                   fit: BoxFit.fitWidth,
//                   child: Text(
//                     '123 ml',
//                     style: TextStyle(fontSize: 30.0),
//                   ),
//                 ),
//                 Text(
//                   'of 1231232 ml',
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
