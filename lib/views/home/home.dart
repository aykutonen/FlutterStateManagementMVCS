import 'package:StateManagementMVCS/views/home/pages/main/main.dart';
import 'package:StateManagementMVCS/views/home/pages/report/report.dart';
import 'package:StateManagementMVCS/views/home/pages/settings/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: CupertinoColors.activeBlue,
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.info),
            label: 'report'.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'home'.tr(),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'settings'.tr(),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return SafeArea(
          child: CupertinoTabView(
            builder: (context) {
              return SingleChildScrollView(
                child: _getTabPage(index),
              );
            },
          ),
        );
      },
    );
  }
}

Widget _getTabPage(int index) {
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
}
