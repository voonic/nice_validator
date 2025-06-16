library;

import 'package:analyzer/dart/constant/value.dart';
import 'package:nice_validator/validators/field_validator_generator.dart';

class MaxLengthValidatorGenerator implements FieldValidatorGenerator {
  @override
  bool supports(String typeName) => typeName == 'MaxLength';

  @override
  String generate(String fieldName, DartObject annotation, String? message) {
    final max = annotation.getField('max')?.toIntValue();
    if (max == null) return '';
    return """
    if ($fieldName != null && $fieldName.length != null && $fieldName.length > $max) {
      errors['$fieldName'] = '\${message ?? 'Maximum $max characters'}';
    }
    """
        .trim();
  }
}
