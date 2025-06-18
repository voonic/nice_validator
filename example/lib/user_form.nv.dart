// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_form.dart';

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

// GitHub: https://github.com/voonic/nice_validator

extension UserFormValidation on UserForm {
  Map<String, String> validate() {
    final errors = <String, String>{};
    if (username == null ||
        (username is String && username?.trim().isEmpty == true)) {
      errors['username'] = 'username is required';
    }
    if (username != null && username!.length < 4) {
      errors['username'] = 'username requires min 4 chars';
    }
    if (username != null && username!.length > 6) {
      errors['username'] = 'username can have max 6 chars';
    }
    if (email == null || (email is String && email?.trim().isEmpty == true)) {
      errors['email'] = 'Email is required';
    }
    if (email != null && !RegExp(r'^.+@.+..+').hasMatch(email!)) {
      errors['email'] = 'Invalid email';
    }
    if (age != null && (age! < 2 || age! > 4)) {
      errors['age'] = 'age value must be between 2 and 4';
    }
    if (file != 'file.txt') {
      errors['file'] = 'file must be equal to file.txt';
    }
    return errors;
  }
}
