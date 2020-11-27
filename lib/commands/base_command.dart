import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/models/register_model.dart';
import 'package:StateManagementMVCS/models/report_model.dart';
import 'package:StateManagementMVCS/models/settings_model.dart';
import 'package:StateManagementMVCS/models/user_model.dart';
import 'package:StateManagementMVCS/services/notification_service.dart';
import 'package:StateManagementMVCS/services/user_service.dart';
import 'package:StateManagementMVCS/services/app_service.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

BuildContext _mainContext;

// The commands will use this to access the Provided models and services.
void init(BuildContext context) => _mainContext = context;

// Provide quick lookup methods for all the top-level models and services. Keeps the Command code slightly cleaner.
class BaseCommand {
  // Models
  UserModel userModel = _mainContext.read();
  AppModel appModel = _mainContext.read();
  ReportModel reportModel = _mainContext.read();
  RegisterModel registerModel = _mainContext.read();
  SettingsModel settingsModel = _mainContext.read();

  // Services
  UserService userService = _mainContext.read();
  AppService appService = _mainContext.read();
  NotificationService notifyService = _mainContext.read();
}
