library;

import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:nice_validator/annotations/form_model.dart';
import 'package:nice_validator/validators/equals_validator_generator.dart';
import 'package:nice_validator/validators/field_validator_generator.dart';
import 'package:nice_validator/validators/max_length_validator_generator.dart';
import 'package:nice_validator/validators/min_length_validator_generator.dart';
import 'package:nice_validator/validators/range_validator_generator.dart';
import 'package:nice_validator/validators/regex_validator_generator.dart';
import 'package:nice_validator/validators/required_validator_generator.dart';
import 'package:source_gen/source_gen.dart';

class ValidatorGenerator extends GeneratorForAnnotation<FormModel> {
  final List<FieldValidatorGenerator> validators = [
    RequiredValidatorGenerator(),
    MinLengthValidatorGenerator(),
    MaxLengthValidatorGenerator(),
    RangeValidatorGenerator(),
    RegexValidatorGenerator(),
    EqualsValidatorGenerator(),
  ];

  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'FormModel can only be used on classes.',
        element: element,
      );
    }

    final className = element.name;
    final extensionName = '${className}Validation';
    final buffer = StringBuffer();

    buffer.writeln('extension $extensionName on $className {');
    buffer.writeln('  Map<String, String> validate() {');
    buffer.writeln('    final errors = <String, String>{};');

    for (final field in element.fields) {
      final fieldName = field.name;

      for (final metadata in field.metadata) {
        final constantValue = metadata.computeConstantValue();
        if (constantValue == null) continue;

        final reader = ConstantReader(constantValue);
        final typeName =
            reader.objectValue.type?.getDisplayString(withNullability: false);
        final message = reader.peek('message')?.stringValue ?? '';
        print(message);
        final validator = validators.firstWhere(
          (v) => v.supports(typeName ?? ''),
          orElse: () => throw InvalidGenerationSourceError(
            'Unsupported validator annotation: $typeName',
            element: field,
          ),
        );

        final validationCode =
            validator.generate(fieldName, constantValue, message);
        buffer.writeln(validationCode);
      }
    }

    buffer.writeln('    return errors;');
    buffer.writeln('  }');
    buffer.writeln('}');

    return buffer.toString();
  }
}
