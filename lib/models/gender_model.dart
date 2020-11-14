enum Gender { f, m }

extension GenderExtension on Gender {
  String get name => this == Gender.f ? "Female" : "Male";
}
