import 'package:StateManagementMVCS/commands/base_command.dart';
import 'package:StateManagementMVCS/models/drunk_model.dart';

class UserCommand extends BaseCommand {
  Future<void> load() async {
    userModel.dailyDrunks = userService.getDailyDrunks();
  }

  Future<bool> addDrunk(int amount) async {
    var model = DrunkModel(amount, appModel.unit.index, DateTime.now());
    var result = await userService.addDrunk(model);
    if (result) userModel.dailyDrunks.add(model);
    return result;
  }
}
