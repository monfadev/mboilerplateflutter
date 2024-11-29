extension SafeConvertExtension on Map<String, dynamic> {
  String asString(String key, {String defaultValue = ''}) {
    if (!containsKey(key)) return defaultValue;
    final value = this[key];
    if (value == null) return defaultValue;
    if (value is String) return value;
    if (value is int) return value.toString();
    if (value is double) return value.toString();
    if (value is bool) return value ? 'true' : 'false';

    return defaultValue;
  }

  int asInt(String key, {int defaultValue = 0}) {
    if (!containsKey(key)) return defaultValue;
    final value = this[key];
    if (value == null) return defaultValue;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is bool) return value ? 1 : 0;
    if (value is String) {
      return int.tryParse(value) ??
          double.tryParse(value)?.toInt() ??
          defaultValue;
    }

    return defaultValue;
  }

  double asDouble(String key, {double defaultValue = 0.0}) {
    final value = this[key];
    if (value == null) return defaultValue;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is bool) return value ? 1.0 : 0.0;
    if (value is String) return double.tryParse(value) ?? defaultValue;

    return defaultValue;
  }

  bool asBool(String key, {bool defaultValue = false}) {
    final value = this[key];

    if (value == null) return defaultValue;
    if (value is bool) return value;
    if (value is int) return value == 0 ? false : true;
    if (value is double) return value == 0 ? false : true;
    if (value is String) {
      if (value == '1' || value.toLowerCase() == 'true') return true;
      if (value == '0' || value.toLowerCase() == 'false') return false;
    }

    return defaultValue;
  }
}
