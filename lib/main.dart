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
        Provider(create: (context) => UserService())
      ],
      child: Builder(
        builder: (context) {
          Commands.init(context);
          return CupertinoApp(
            debugShowCheckedModeBanner: false,
            title: 'Helo',
            home: CupertinoHome(),
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
        // backgroundColor: CupertinoColors.destructiveRed,
        navigationBar: CupertinoNavigationBar(
          // backgroundColor: CupertinoColors.activeGreen,
          leading: Text('Leading'),
          middle: Text('Middle'),
          trailing: Text('Trailing'),
        ),
        child: SafeArea(
          child: Center(
            child: currentUser != null ? HomePage() : LoginPage(),
          ),
        ));
  }
}
