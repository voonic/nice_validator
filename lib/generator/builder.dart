library;

import 'package:build/build.dart';
import 'package:nice_validator/generator/validator_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder validatorBuilder(BuilderOptions options) =>
    PartBuilder([ValidatorGenerator()], '.g.dart');
