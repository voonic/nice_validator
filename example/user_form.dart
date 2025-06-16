import 'package:nice_validator/nice_validator.dart';

@FormModel()
class UserForm {
  @Required(message: 'Username is required')
  @MinLength(4, message: 'Username must be at least 4 characters')
  final String? username;

  @Required(message: 'Email is required')
  final String? email;

  UserForm({this.username, this.email});
}
