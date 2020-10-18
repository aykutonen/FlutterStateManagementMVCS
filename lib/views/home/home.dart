import 'package:StateManagementMVCS/views/home/pages/main/main.dart';
import 'package:StateManagementMVCS/views/home/pages/report/report.dart';
import 'package:StateManagementMVCS/views/home/pages/settings/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // AppModel model = context.select<AppModel, AppModel>((e) => e);

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: CupertinoColors.activeBlue,
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.info),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return SafeArea(
          child: CupertinoTabView(
            builder: (context) {
              switch (index) {
                case 0:
                  return ReportPage();
                case 1:
                  return MainPage();
                case 2:
                  return SettingsPage();
                default:
                  return MainPage();
              }
            },
          ),
        );
      },
    );
  }
}

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool _isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     AppModel model = context.select<AppModel, AppModel>((e) => e);

//     String content =
//         "Hi, ${model.currentUser}. isFirsttime: ${model.isFirstTime}. Your Language: ${model.language}. ";
//     content +=
//         "Water Unit: ${model.unit}. Wake up time: ${model.wakingUp.toDisplayString}. Sleeping time: ${model.sleeping.toDisplayString}. ";
//     content +=
//         "Your target amount: ${model.targetAmount}. Your notification settings: ${model.notification}.";

//     return CupertinoPageScaffold(
//       child: SafeArea(
//         child: Center(
//           child: _isLoading
//               ? Center(child: CircularProgressIndicator())
//               : Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Text(
//                     content,
//                     maxLines: 10,
//                     style: TextStyle(
//                       height: 1.7,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }
