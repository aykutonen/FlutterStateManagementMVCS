import 'package:StateManagementMVCS/commands/base_command.dart' as Commands;
import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/utils/router/router.dart';
import 'package:StateManagementMVCS/services/app_service.dart';
import 'package:StateManagementMVCS/services/user_service.dart';
import 'package:StateManagementMVCS/utils/shared_preferences_util.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/models/user_model.dart';
import 'package:StateManagementMVCS/views/home/home.dart';
import 'package:StateManagementMVCS/views/onboarding/onboarding.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      // Models
      ChangeNotifierProvider(create: (c) => AppModel()),
      ChangeNotifierProvider(create: (c) => UserModel()),

      // Services
      Provider(create: (c) => UserService()),
      Provider(create: (c) => AppService()),

      Provider<BuildContext>(create: (c) => c),
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _isLoadData = false;

  @override
  void initState() {
    appInit();
    super.initState();
  }

  void appInit() async {
    Commands.init(context);
    await Preferences.init();
    AppCommand().load().then((e) {
      setState(() => _isLoadData = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoadData)
      return Container(
        color: CupertinoColors.white,
      );

    bool _isFirst = context.select<AppModel, bool>((e) => e.isFirstTime);

    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Helo',
      onGenerateRoute: generateRoute,
      home: _isFirst ? Onboarding() : HomePage(),
    );
  }
}
