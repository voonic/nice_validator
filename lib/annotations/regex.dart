library;

import 'validator.dart';

class Regex extends Validator {
  final String pattern;
  const Regex(this.pattern, {super.message});

  @override
  String? validate(dynamic value) {
    if (value is String && !RegExp(pattern).hasMatch(value)) {
      return message ?? 'Invalid format';
    }
    return null;
  }
}
