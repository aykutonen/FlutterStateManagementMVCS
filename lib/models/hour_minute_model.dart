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
