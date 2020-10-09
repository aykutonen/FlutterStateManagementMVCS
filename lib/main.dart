import 'package:StateManagementMVCS/router.dart';
import 'package:StateManagementMVCS/routing_constants.dart';
import 'package:StateManagementMVCS/services/app_service.dart';
import 'package:StateManagementMVCS/views/home_page.dart';
import 'package:StateManagementMVCS/views/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import './commands/base_command.dart' as Commands;
import './models/app_model.dart';
import './models/user_model.dart';
import './services/user_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Models
        ChangeNotifierProvider(create: (c) => AppModel()),
        ChangeNotifierProvider(create: (c) => UserModel()),

        // Services
        Provider(create: (c) => UserService()),
        Provider(create: (c) => AppService())
      ],
      child: Builder(
        builder: (context) {
          Commands.init(context);
          bool isFirstTime =
              context.select<AppModel, bool>((v) => v.isFirstTime);

          return CupertinoApp(
            debugShowCheckedModeBanner: false,
            title: 'Helo',
            onGenerateRoute: generateRoute,
            initialRoute: isFirstTime ? OnboardingPageRoute : HomePageRoute,
            // home: CupertinoHome(),
          );
        },
      ),
    );
  }
}

class CupertinoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String currentUser =
        context.select<AppModel, String>((value) => value.currentUser);

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: currentUser != null ? HomePage() : LoginPage(),
        ),
      ),
    );
  }
}
