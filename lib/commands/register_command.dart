import 'package:StateManagementMVCS/commands/base_command.dart';
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
}
