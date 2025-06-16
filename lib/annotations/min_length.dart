library;

import 'validator.dart';

class MinLength extends Validator {
  final int min;
  const MinLength(this.min, {super.message});

  @override
  String? validate(dynamic value) {
    if (value is String && value.length < min) {
      return message ?? 'Minimum $min characters';
    }
    return null;
  }
}
