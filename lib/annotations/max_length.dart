library;

import 'validator.dart';

class MaxLength extends Validator {
  final int max;
  const MaxLength(this.max, {super.message});
}
