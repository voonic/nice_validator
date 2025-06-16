library;

import 'package:analyzer/dart/constant/value.dart';
import 'package:nice_validator/validators/field_validator_generator.dart';

class RequiredValidatorGenerator implements FieldValidatorGenerator {
  @override
  bool supports(String typeName) => typeName == 'Required';

  @override
  String generate(String fieldName, DartObject annotation, String? message) {
    return """
    if ($fieldName == null || ($fieldName is String && $fieldName?.trim().isEmpty == true)) {
      errors['$fieldName'] = '${message ?? '$fieldName is required'}';
    }
    """
        .trim();
  }
}
