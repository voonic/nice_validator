library;

import 'validator.dart';

class Range extends Validator {
  final num min;
  final num max;
  const Range(this.min, this.max, {super.message});

  @override
  String? validate(dynamic value) {
    if (value is num && (value < min || value > max)) {
      return message ?? 'Must be between $min and $max';
    }
    return null;
  }
}
