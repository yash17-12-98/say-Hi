extension StringNullSafety on String? {
  String defaultValue({String value = ''}) {
    return this ?? value;
  }
}

extension BoolNullSafety on bool? {
  bool defaultBoolValue({bool value = false}) {
    return this ?? value;
  }
}
