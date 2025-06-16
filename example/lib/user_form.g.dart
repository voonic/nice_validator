// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_form.dart';

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

extension UserFormValidation on UserForm {
  Map<String, String> validate() {
    final errors = <String, String>{};
    if (username == null ||
        (username is String && username?.trim().isEmpty == true)) {
      errors['username'] = 'Username is mandatory';
    }
    if (username != null && username.length != null && username.length < 4) {
      errors['username'] = '${message ?? 'Minimum 4 characters'}';
    }
    if (email == null || (email is String && email?.trim().isEmpty == true)) {
      errors['email'] = 'Email is required';
    }
    return errors;
  }
}
