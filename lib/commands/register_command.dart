import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/commands/base_command.dart';
import 'package:StateManagementMVCS/commands/report_command.dart';
import 'package:StateManagementMVCS/commands/user_command.dart';
import 'package:StateManagementMVCS/models/hour_minute_model.dart';
import 'package:StateManagementMVCS/models/view_model/register_form_model.dart';
import 'package:international_system_of_units/international_system_of_units.dart';

class RegisterCommand extends BaseCommand {
  void calculateTargetAndSaveToModel(Map<String, dynamic> fields) {
    var model = RegisterFormModel.fromMap(fields);
    // ağırlık birimimiz "KG".
    // ağırlığı 0.03 ile çarpıp hedef Litre'yi buluyoruz.
    // Litre cinsinden olan hedefi mililitre'ye çeviriyoruz.
    model.target = (model.weight * 0.03).toMilliliters.toInt();
    registerModel.formModel = model;
  }

  Future<void> save() async {
    // modeldeki verilerle appmodel'i doldur.
    // isfirst değerini boşalt.
    var command = AppCommand();
    var model = registerModel.formModel;
    await command.saveUsername(model.name);
    await command.setUnit(model.waterUnit);
    await command.setWakingUp(
        HourMinute(model.wakeUp.inHours, model.wakeUp.inMinutes.remainder(60)));
    await command.setSleeping(
        HourMinute(model.sleep.inHours, model.sleep.inMinutes.remainder(60)));
    await command.setTargetAmount(model.target);
    await command.setWeight(model.weight);
    await command.saveIsFirstTime(false);

    // Home ekranı için gereken bilgileri yükle.
    await UserCommand().load();
    await ReportCommand().load();
  }
}
