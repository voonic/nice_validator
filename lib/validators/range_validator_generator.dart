library;

import 'package:analyzer/dart/constant/value.dart';
import 'package:nice_validator/validators/field_validator_generator.dart';

class RangeValidatorGenerator implements FieldValidatorGenerator {
  @override
  bool supports(String typeName) => typeName == 'Range';

  @override
  String generate(String fieldName, DartObject annotation, String? message) {
    final minValue = annotation.getField('min');
    final maxValue = annotation.getField('max');

    final min = minValue?.toDoubleValue() ?? minValue?.toIntValue();
    final max = maxValue?.toDoubleValue() ?? maxValue?.toIntValue();
    return """
    if ($fieldName != null && ($fieldName! < $min || $fieldName! > $max)) {
      errors['$fieldName'] = '${message != null && message.isNotEmpty ? message : '$fieldName value must be between $min and $max'}';
    }
    """
        .trim();
  }
}
