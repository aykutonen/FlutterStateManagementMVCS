class NotifyModel {
  int id;
  String title;
  String body;
  String payload;
  int sendDateUnix;

  NotifyModel({
    this.title,
    this.body,
    this.payload,
    DateTime sendDate,
  }) {
    this.sendDateUnix = sendDate.toUtc().millisecondsSinceEpoch;
  }

  NotifyModel.withId({
    this.id,
    this.title,
    this.body,
    this.payload,
    this.sendDateUnix,
  });

  DateTime get sendDate =>
      DateTime.fromMillisecondsSinceEpoch(sendDateUnix, isUtc: true).toLocal();

  factory NotifyModel.fromMap(Map<String, dynamic> map) => NotifyModel.withId(
        id: map['id'],
        title: map['title'],
        body: map['map'],
        payload: map['payload'],
        sendDateUnix: map['sendDateUnix'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'body': body,
        'payload': payload,
        'sendDateUnix': sendDateUnix,
      };
}
