import 'package:StateManagementMVCS/models/unit_model.dart';

class DrunkModel {
  final int amount;
  final int unitIndex;
  final DateTime createDate;

  Unit get unit => Unit.values[unitIndex];

  const DrunkModel(this.amount, this.unitIndex, this.createDate);

  factory DrunkModel.fromJson(Map<String, dynamic> json) {
    return DrunkModel(
      json['amount'] as int,
      json['unitIndex'] as int,
      DateTime.parse(json['createDate'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'unitIndex': unitIndex,
        'createDate': createDate.toIso8601String(),
      };
}
