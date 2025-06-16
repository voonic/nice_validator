library;

import 'validator.dart';

class Equals extends Validator {
  final Object expected;
  const Equals(this.expected, {super.message});

  @override
  String? validate(dynamic value) {
    if (value != expected) {
      return message ?? 'Must equal $expected';
    }
    return null;
  }
}
