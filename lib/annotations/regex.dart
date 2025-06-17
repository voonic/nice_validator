library;

import 'validator.dart';

class Regex extends Validator {
  final String pattern;
  const Regex(this.pattern, {super.message});
}
