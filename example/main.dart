import 'package:nice_validator_example/user_form.dart';

void main() {
  final form = UserForm(username: 'abc', email: null);
  final errors = form.validate();

  if (errors.isEmpty) {
    print('✅ Form is valid');
  } else {
    print('❌ Validation Errors:');
    errors.forEach((field, msg) => print('- \$field: \$msg'));
  }
}
