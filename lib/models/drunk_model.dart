import 'package:StateManagementMVCS/models/unit_model.dart';

class DrunkModel {
  DrunkModel({
    this.amount,
    this.unitIndex,
    this.createDate,
  });

  int amount;
  int unitIndex;
  DateTime createDate;
  Unit get unit => Unit.values[unitIndex];

  factory DrunkModel.fromJson(Map<String, dynamic> json) => DrunkModel(
        amount: json["amount"],
        unitIndex: json["unitIndex"],
        createDate: DateTime.parse(json["createDate"]),
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "unitIndex": unitIndex,
        "createDate": createDate.toIso8601String(),
      };
}
