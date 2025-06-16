library;

import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:nice_validator/annotations/form_model.dart';
import 'package:source_gen/source_gen.dart';

class ValidatorGenerator extends GeneratorForAnnotation<FormModel> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    if (element is! ClassElement) return '';

    final className = element.name;
    final mixinName = '_\$${className}Validation';
    final buffer = StringBuffer();

    buffer.writeln('mixin $mixinName on $className {');
    buffer.writeln('  Map<String, String> validate() {');
    buffer.writeln('    final errors = <String, String>{};');

    for (final field in element.fields) {
      final fieldName = field.name;
      for (final meta in field.metadata) {
        final constantValue = meta.computeConstantValue();
        final type =
            constantValue?.type?.getDisplayString(withNullability: false);
        final message = constantValue?.getField('message')?.toStringValue();

        if (type == 'Required') {
          buffer.writeln(
              "    if ($fieldName == null || ($fieldName is String && $fieldName.trim().isEmpty)) {");
          buffer.writeln(
              "      errors['$fieldName'] = '${message ?? 'This field is required'}';");
          buffer.writeln("    }");
        }

        if (type == 'MinLength') {
          final min = constantValue?.getField('min')?.toIntValue();
          buffer.writeln(
              "    if ($fieldName != null && $fieldName.length < $min) {");
          buffer.writeln(
              "      errors['$fieldName'] = '${message ?? 'Minimum $min characters'}';");
          buffer.writeln("    }");
        }
      }
    }

    buffer.writeln('    return errors;');
    buffer.writeln('  }');
    buffer.writeln('}');

    return buffer.toString();
  }
}
