import 'package:StateManagementMVCS/commands/base_command.dart' as Commands;
import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/commands/notification_command.dart';
import 'package:StateManagementMVCS/commands/report_command.dart';
import 'package:StateManagementMVCS/commands/user_command.dart';
import 'package:StateManagementMVCS/models/language_model.dart';
import 'package:StateManagementMVCS/models/register_model.dart';
import 'package:StateManagementMVCS/models/report_model.dart';
import 'package:StateManagementMVCS/models/view_model/settings_model.dart';
import 'package:StateManagementMVCS/services/notification_service.dart';
import 'package:StateManagementMVCS/utils/notification_helper.dart';
import 'package:StateManagementMVCS/utils/router/router.dart';
import 'package:StateManagementMVCS/services/app_service.dart';
import 'package:StateManagementMVCS/services/user_service.dart';
import 'package:StateManagementMVCS/utils/router/router_constants.dart';
import 'package:StateManagementMVCS/utils/shared_preferences_util.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/models/user_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      // Models
      ChangeNotifierProvider(create: (c) => AppModel()),
      ChangeNotifierProvider(create: (c) => UserModel()),
      ChangeNotifierProvider(create: (c) => ReportModel()),
      ChangeNotifierProvider(create: (c) => RegisterModel()),
      ChangeNotifierProvider(create: (c) => SettingsModel()),

      // Services
      Provider(create: (c) => UserService()),
      Provider(create: (c) => AppService()),
      Provider(create: (c) => NotificationService()),

      Provider<BuildContext>(create: (c) => c),
    ],
    child: EasyLocalization(
      supportedLocales: [Locale('en', ''), Locale('tr', '')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', ''),
      child: MainApp(),
    ),
  ));
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  bool _isLoadData = false;
  bool _isFirst = true;

  @override
  void initState() {
    // Uygulama durumunu takip edebilmek için gerekli.
    // Ayrıca Class'a "with WidgetsBindingObserver" eklenmeli.
    // Durum değişikliğine göre işlem yapmak için de "didChangeAppLifecycleState" fonksiyonu kullanılıyor.
    WidgetsBinding.instance.addObserver(this);
    appInit();
    super.initState();
  }

  /// App durumu değişikliklerini dinleyen arkadaş
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed)
      NotificationCommand().getAndSetPermissionAndCalculateOrCleanNotifcation();

    super.didChangeAppLifecycleState(state);
  }

  void appInit() async {
    // Notification servisini ayağa kaldır.
    await NotificationHelper().init();
    // Notification'a tıklandığında tetiklenecek fonksiyonu ata.
    await NotificationHelper().assignOnClick(onNotificationClick);

    Commands.init(context);
    await Preferences.init();
    await AppCommand().init();
    await ReportCommand().init();

    setState(() => _isFirst = context.read<AppModel>().isFirstTime);
    if (_isFirst) {
      AppCommand().setLanguage(Language.English);
      // TODO: uygulama ilk açılışta cihaz varsayılanını ata.
    } else {
      await UserCommand().load();
      await ReportCommand().load();
      // Uygulama normal açıldığında mevcut bildirim yetkisini kontrol et
      // ve bildirimleri temizle ya da yenilerini hesapla
      NotificationCommand().getAndSetPermissionAndCalculateOrCleanNotifcation();
    }
    setState(() => _isLoadData = true);
  }

  onNotificationClick(String payload) {
    debugPrint(payload);
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoadData)
      return Container(
        color: CupertinoColors.white,
        child: CupertinoActivityIndicator(),
      );

    return CupertinoApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'app_name'.tr(),
      onGenerateRoute: generateRoute,
      initialRoute: _isFirst ? RegisterPageRoute : HomePageRoute,
    );
  }
}
