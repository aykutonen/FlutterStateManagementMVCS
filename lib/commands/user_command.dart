import 'package:StateManagementMVCS/commands/base_command.dart';
import 'package:StateManagementMVCS/models/drunk_model.dart';

class UserCommand extends BaseCommand {
  Future<void> load() async {
    userModel.dailyDrunks = await getDailyDrunks();
  }

  DateTime _calculateTrackDate() {
    var now = DateTime.now();
    var todayStart = DateTime(now.year, now.month, now.day);
    var wakeUp = appModel.wakingUp;
    var todayWakeup =
        DateTime(now.year, now.month, now.day, wakeUp.hour, wakeUp.minute);

    // Şuan, gece 00:00'ı geçmiş ve kullanıcının uyanma saatinden önce ise,
    // kaydı bir önceki güne ait olarak kaydet.
    if ((now.isAtSameMomentAs(todayStart) || now.isAfter(todayStart)) &&
        now.isBefore(todayWakeup)) {
      now = now.add(Duration(days: -1));
    }

    // Kaydın ait olduğu tarihi ayarla
    var trackDate = DateTime(now.year, now.month, now.day);
    return trackDate;
  }

  Future<List<DrunkModel>> getDailyDrunks() async {
    var trackDate = _calculateTrackDate();
    var nextDate = trackDate.add(Duration(days: 1));
    return await userService.getDrunks(trackDate, nextDate);
  }

  Future<bool> addDrunk(int amount) async {
    var trackDate = _calculateTrackDate();

    var model = DrunkModel(
        amount: amount,
        unitIndex: appModel.unit.index,
        createDate: DateTime.now(),
        trackDate: trackDate);

    var result = await userService.addDrunk(model);
    if (result) userModel.dailyDrunks = [model, ...userModel.dailyDrunks];

    return result;
  }
}
