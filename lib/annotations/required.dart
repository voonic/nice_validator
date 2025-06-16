library;

import 'validator.dart';

class Required extends Validator {
  const Required({super.message});

  @override
  String? validate(dynamic value) {
    if (value == null || (value is String && value.trim().isEmpty)) {
      return message ?? 'This field is required';
    }
    return null;
  }
}
