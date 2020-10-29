import 'package:StateManagementMVCS/commands/base_command.dart';
import 'package:StateManagementMVCS/models/drunk_model.dart';

class UserCommand extends BaseCommand {
  Future<void> load() async {
    userModel.dailyDrunks = await userService.getDailyDrunks();
  }

  Future<bool> addDrunk(int amount) async {
    var model = DrunkModel(
        amount: amount,
        unitIndex: appModel.unit.index,
        createDate: DateTime.now());

    var result = await userService.addDrunk(model);
    if (result) userModel.addDailyDrunk(model);
    return result;
  }
}
