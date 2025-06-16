library;

import 'package:analyzer/dart/constant/value.dart';
import 'package:nice_validator/validators/field_validator_generator.dart';

class RegexValidatorGenerator implements FieldValidatorGenerator {
  @override
  bool supports(String typeName) => typeName == 'Regex';

  @override
  String generate(String fieldName, DartObject annotation, String? message) {
    final pattern = annotation.getField('pattern')?.toStringValue();
    if (pattern == null) return '';
    return """
    if ($fieldName != null && !RegExp(r'$pattern').hasMatch($fieldName)) {
      errors['$fieldName'] = '\${message ?? 'Invalid format'}';
    }
    """
        .trim();
  }
}
