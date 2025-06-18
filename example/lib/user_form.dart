import 'package:nice_validator/nice_validator.dart';
part 'user_form.nv.dart';

@FormModel()
class UserForm {
  @Required()
  @MinLength(4, message: 'Username must be at least 4 characters')
  final String? username;

  @Required(message: 'Email is required')
  @Regex('^.+@.+\..+', message: 'Invalid email')
  final String? email;

  @Range(2, 4)
  final int? age;

  UserForm({this.username, this.email, this.age});
}
