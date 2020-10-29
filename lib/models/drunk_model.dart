import 'package:StateManagementMVCS/models/unit_model.dart';

class DrunkModel {
  DrunkModel({
    this.amount,
    this.unitIndex,
    DateTime createDate,
  }) {
    this.createDateUnix = createDate.toUtc().millisecondsSinceEpoch;
  }

  DrunkModel.withId({
    this.id,
    this.amount,
    this.unitIndex,
    this.createDateUnix,
  });

  int id;
  int amount;
  int unitIndex;
  int createDateUnix;

  Unit get unit => Unit.values[unitIndex];
  DateTime get createDate =>
      DateTime.fromMillisecondsSinceEpoch(createDateUnix, isUtc: true)
          .toLocal();

  factory DrunkModel.fromJson(Map<String, dynamic> json) => DrunkModel.withId(
        id: json["id"],
        amount: json["amount"],
        unitIndex: json["unitIndex"],
        createDateUnix: json["createDateUnix"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "amount": amount,
        "unitIndex": unitIndex,
        "createDateUnix": createDateUnix,
      };
}
