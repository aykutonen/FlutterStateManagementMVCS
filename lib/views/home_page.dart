import 'package:StateManagementMVCS/commands/logout_command.dart';
import 'package:StateManagementMVCS/commands/refresh_posts_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/models/user_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;

  void _handleRefreshPressed() async {
    // Disable the RefreshBtn while the Command is running
    setState(() => _isLoading = true);

    // Run Command
    await RefreshPostsCommand().run(context.read<AppModel>().currentUser);

    // Re-enable refresh button when command is done
    setState(() => _isLoading = false);
  }

  void _handleLogoutPressed() async {
    setState(() => _isLoading = true);

    // Run Command
    await LogOutCommand().run();

    // Re-enable logout button when command is done
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    // Bind to UserModel.userPosts
    var posts =
        context.select<UserModel, List<String>>((value) => value.userPosts);

    // Disable btn by removing listener when we're loading.
    VoidCallback btnHandler = _isLoading ? null : _handleRefreshPressed;
    VoidCallback btnLogoutHandler = _isLoading ? null : _handleLogoutPressed;

    // Render list of widgets
    var listWidgets = posts.map((post) => Text(post)).toList();

    return CupertinoPageScaffold(
      child: _isLoading
          ? CircularProgressIndicator()
          : Column(
              children: [
                Flexible(
                  child: ListView(children: listWidgets),
                ),
                FlatButton(
                  child: Text('Refresh'),
                  onPressed: btnHandler,
                ),
                FlatButton(
                  child: Text('Log Out'),
                  onPressed: btnLogoutHandler,
                ),
              ],
            ),
    );
  }
}
