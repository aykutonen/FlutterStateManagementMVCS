import 'package:StateManagementMVCS/models/gender_model.dart';
import 'package:StateManagementMVCS/models/hour_minute_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';

class RegisterModel {
  String name;
  Gender gender = Gender.f;
  int weight;
  Unit waterUnit = Unit.ml;
  Duration wakeUp = Duration(hours: 8, minutes: 0);
  Duration sleep = Duration(hours: 11, minutes: 0);

  Map<String, dynamic> toMap() => {
        'name': name,
        'gender': gender,
        'weight': weight,
        'waterUnit': waterUnit,
        'wakeUp': wakeUp,
        'sleep': sleep
      };
}
