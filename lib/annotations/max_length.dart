library;

import 'validator.dart';

class MaxLength extends Validator {
  final int max;
  const MaxLength(this.max, {super.message});

  @override
  String? validate(dynamic value) {
    if (value is String && value.length > max) {
      return message ?? 'Maximum $max characters';
    }
    return null;
  }
}
