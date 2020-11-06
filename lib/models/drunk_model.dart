import 'package:StateManagementMVCS/models/unit_model.dart';

class DrunkModel {
  DrunkModel({
    this.amount,
    this.unitIndex,
    DateTime createDate,
    DateTime trackDate,
  }) {
    this.createDateUnix = createDate.toUtc().millisecondsSinceEpoch;
    this.trackDateUnix = trackDate.toUtc().millisecondsSinceEpoch;
  }

  DrunkModel.withId({
    this.id,
    this.amount,
    this.unitIndex,
    this.createDateUnix,
    this.trackDateUnix,
  });

  int id;
  int amount;
  int unitIndex;
  int createDateUnix;
  int trackDateUnix;

  Unit get unit => Unit.values[unitIndex];
  DateTime get createDate =>
      DateTime.fromMillisecondsSinceEpoch(createDateUnix, isUtc: true)
          .toLocal();

  DateTime get trackDate =>
      DateTime.fromMillisecondsSinceEpoch(createDateUnix, isUtc: true)
          .toLocal();

  factory DrunkModel.fromJson(Map<String, dynamic> json) => DrunkModel.withId(
        id: json["id"],
        amount: json["amount"],
        unitIndex: json["unitIndex"],
        createDateUnix: json["createDateUnix"],
        trackDateUnix: json["trackDateUnix"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "amount": amount,
        "unitIndex": unitIndex,
        "createDateUnix": createDateUnix,
        "trackDateUnix": trackDateUnix,
      };
}
