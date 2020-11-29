import 'package:StateManagementMVCS/commands/notification_command.dart';
import 'package:StateManagementMVCS/utils/router/router_constants.dart';
import 'package:StateManagementMVCS/views/home/widgets/seperator.dart';
import 'package:StateManagementMVCS/views/register/pages/result/widgets/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterNotification extends StatefulWidget {
  @override
  _RegisterNotificationState createState() => _RegisterNotificationState();
}

class _RegisterNotificationState extends State<RegisterNotification> {
  String _info = "";
  bool _isWorking = false;

  void _requestHandle() async {
    setState(() => _isWorking = true);
    var status = await NotificationCommand().requestPermission();
    if (status) {
      setState(() => _info = "");
      NotificationCommand().calculateNextNofications();
      await Navigator.pushNamedAndRemoveUntil(
          context, HomePageRoute, (route) => false);
    } else {
      setState(() {
        _info =
            "Bildirimlere onay vermedin. Bunu daha sonra Ayarlar menüsünden açabilirsin.";
      });
    }
    setState(() => _isWorking = false);
  }

  void _skipHandle() async {
    await Navigator.pushNamedAndRemoveUntil(
        context, HomePageRoute, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegisterBackButton(),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Bildirim almak ister misin?'),
                if (_isWorking) CupertinoActivityIndicator(),
                const Seperator(),
                if (_info.isEmpty)
                  CupertinoButton(
                    child: Text(
                      'Bildirimleri aç',
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(color: CupertinoColors.activeBlue),
                    ),
                    onPressed: _requestHandle,
                  ),
                if (_info.isNotEmpty)
                  Center(
                      child: Text(
                    _info,
                    textAlign: TextAlign.center,
                  )),
                const Seperator(),
                CupertinoButton(
                  child: Text(_info.isEmpty ? 'Hayır' : 'Devam'),
                  onPressed: _skipHandle,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
