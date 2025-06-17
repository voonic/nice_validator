library;

import 'validator.dart';

class MinLength extends Validator {
  final int min;
  const MinLength(this.min, {super.message});
}
