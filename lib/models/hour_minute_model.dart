class HourMinute {
  final int hour;
  final int minute;

  const HourMinute(this.hour, this.minute);

  factory HourMinute.fromJson(Map<String, dynamic> json) {
    return HourMinute(json['hour'], json['minute']);
  }

  Map<String, dynamic> toJson() => {
        'hour': hour,
        'minute': minute,
      };
}

extension HourMinuteExtension on HourMinute {
  String get toDisplayString {
    var h = this.hour > 9 ? this.hour : "0${this.hour}";
    var m = this.minute > 9 ? this.minute : "0${this.minute}";
    return '$h:$m';
  }
}
