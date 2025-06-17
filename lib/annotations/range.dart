library;

import 'validator.dart';

class Range extends Validator {
  final num min;
  final num max;
  const Range(this.min, this.max, {super.message});
}
