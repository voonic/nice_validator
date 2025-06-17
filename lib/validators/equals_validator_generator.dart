library;

import 'package:analyzer/dart/constant/value.dart';
import 'package:nice_validator/validators/field_validator_generator.dart';

class EqualsValidatorGenerator implements FieldValidatorGenerator {
  @override
  bool supports(String typeName) => typeName == 'Equals';

  @override
  String generate(String fieldName, DartObject annotation, String? message) {
    final expected = annotation.getField('expected');
    final str = expected?.toStringValue();
    final intVal = expected?.toIntValue();
    final dblVal = expected?.toDoubleValue();
    final boolVal = expected?.toBoolValue();
    final val = str != null ? "'\$str'" : (intVal ?? dblVal ?? boolVal);
    return """
    if ($fieldName != $val) {
      errors['$fieldName'] = '${message != null && message.isNotEmpty ? message : '$fieldName must be equal to $val'}';
    }
    """
        .trim();
  }
}
