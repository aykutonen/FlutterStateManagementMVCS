import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  bool isDark;
  AppTheme({@required this.isDark});

  CupertinoThemeData get themeData => isDark ? _darkTheme : _lightTheme;

  static CupertinoThemeData _lightTheme = CupertinoThemeData().copyWith(
    brightness: Brightness.light,
    primaryColor: CupertinoColors.activeBlue,
    scaffoldBackgroundColor: CupertinoColors.white,
  );

  static CupertinoThemeData _darkTheme = CupertinoThemeData().copyWith(
    brightness: Brightness.dark,
    primaryColor: CupertinoColors.activeGreen,
    scaffoldBackgroundColor: CupertinoColors.tertiarySystemBackground,
  );
}
