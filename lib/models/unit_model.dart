enum Unit { ml, oz }

extension UnitExtension on Unit {
  String get name => this.toString().split('.')[1];
}
