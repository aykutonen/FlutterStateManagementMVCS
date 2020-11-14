import 'package:StateManagementMVCS/models/gender_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';

class RegisterFormModel {
  String name;
  Gender gender;
  double weight;
  Unit waterUnit;
  Duration wakeUp;
  Duration sleep;
  int target;

  RegisterFormModel({
    this.name,
    this.gender = Gender.f,
    this.weight,
    this.waterUnit = Unit.ml,
    this.wakeUp = const Duration(hours: 8, minutes: 0),
    this.sleep = const Duration(hours: 23, minutes: 0),
    this.target = 0,
  });

  factory RegisterFormModel.fromMap(Map<String, dynamic> field) =>
      RegisterFormModel(
        gender: field['gender'],
        name: field['name'],
        sleep: field['sleep'],
        target: field['target'],
        wakeUp: field['wakeUp'],
        waterUnit: field['waterUnit'],
        weight: field['weight'] as double,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'gender': gender,
        'weight': weight,
        'waterUnit': waterUnit,
        'wakeUp': wakeUp,
        'sleep': sleep,
        'target': target
      };
}
