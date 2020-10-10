import 'package:StateManagementMVCS/commands/base_command.dart' as Commands;
import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/commands/refresh_posts_command.dart';
import 'package:StateManagementMVCS/router.dart';
import 'package:StateManagementMVCS/routing_constants.dart';
import 'package:StateManagementMVCS/services/app_service.dart';
import 'package:StateManagementMVCS/services/user_service.dart';
import 'package:StateManagementMVCS/utils/shared_preferences_util.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/models/user_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(MyApp());

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
  String _initialRoute;
  // bool _isFrist;

  @override
  void initState() {
    super.initState();
    appInit();
  }

  void appInit() async {
    Commands.init(context);
    await Preferences.init();
    AppCommand().load().then((_) async {
      bool _isFrist = context.read<AppModel>().isFirstTime;

      if (!_isFrist) {
        RefreshPostsCommand().run(context.read<AppModel>().currentUser);
        setState(() => _initialRoute = HomePageRoute);
      } else {
        setState(() => _initialRoute = OnboardingPageRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Helo',
      onGenerateRoute: generateRoute,
      initialRoute: _initialRoute,
    );
  }
}
