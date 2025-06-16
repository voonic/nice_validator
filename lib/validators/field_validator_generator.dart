library;

import 'package:analyzer/dart/constant/value.dart';

abstract class FieldValidatorGenerator {
  bool supports(String typeName);
  String generate(String fieldName, DartObject annotation, String? message);
}
