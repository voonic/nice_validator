library;

import 'package:analyzer/dart/constant/value.dart';
import 'package:nice_validator/validators/field_validator_generator.dart';

class MinLengthValidatorGenerator implements FieldValidatorGenerator {
  @override
  bool supports(String typeName) => typeName == 'MinLength';

  @override
  String generate(String fieldName, DartObject annotation, String? message) {
    final min = annotation.getField('min')?.toIntValue();
    if (min == null) return '';
    return """
    if ($fieldName != null && $fieldName!.length < $min) {
      errors['$fieldName'] = '${message != null && message.isNotEmpty ? message : '$fieldName requires min $min chars'}';
    }
    """
        .trim();
  }
}
