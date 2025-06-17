library;

import 'validator.dart';

class Equals extends Validator {
  final Object expected;
  const Equals(this.expected, {super.message});
}
