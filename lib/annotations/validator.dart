library;

abstract class Validator {
  final String? message;
  const Validator({this.message});
  String? validate(dynamic value);
}
