library;

import 'package:analyzer/dart/constant/value.dart';
import 'package:nice_validator/validators/field_validator_generator.dart';

class RangeValidatorGenerator implements FieldValidatorGenerator {
  @override
  bool supports(String typeName) => typeName == 'Range';

  @override
  String generate(String fieldName, DartObject annotation, String? message) {
    final min = annotation.getField('min')?.toDoubleValue();
    final max = annotation.getField('max')?.toDoubleValue();
    return """
    if ($fieldName != null && ($fieldName < $min || $fieldName > $max)) {
      errors['$fieldName'] = '\${message ?? 'Must be between $min and $max'}';
    }
    """
        .trim();
  }
}
