extension DurationExtension on Duration {
  String get toDisplay =>
      "${this.inHours.toString().padLeft(2, '0')}:${this.inMinutes.remainder(60).toString().padLeft(2, '0')}";
}
