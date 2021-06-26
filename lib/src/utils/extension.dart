extension IntegerExtension on int? {
  int orZero() {
    return this ?? 0;
  }
}

extension DoubleExtension on double? {
  double orZero() {
    return this ?? 0.0;
  }
}

extension StringExtension on String? {
  String orEmpty() {
    return this ?? "";
  }

  bool toBool() {
    return this?.toLowerCase() == 'true';
  }

  int? toIntOrNull() {
    return int.tryParse(this.orEmpty());
  }

  double? toDoubleOrNull() {
    return double?.tryParse(this.orEmpty());
  }
}