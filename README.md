# Form Validation Framework

A lightweight, annotation-based validation framework for Dart. Define validations declaratively using annotations, and auto-generate `validate()` methods with field-level error messages using `source_gen` and `build_runner`.

---

## 🚀 Features

- ✅ Use `@Required`, `@MinLength`, `@Range`, etc. directly on fields
- ✅ Generate `validate()` methods automatically
- ✅ Support for custom error messages
- ✅ Works with any Dart model class using `@FormModel()`
- ✅ No runtime reflection; fully compatible with Flutter

---

## 🧱 Example

```dart
import 'package:nice_validator/nice_validator.dart';
part 'user_form.nv.dart'; // <-- this is required <filename>.nv.dart

@FormModel()
class UserForm {
  @Required(message: 'Username is mandatory')
  @MinLength(4, message: 'Username must be at least 4 characters')
  final String? username;

  @Required(message: 'Email is required')
  final String? email;

  UserForm({this.username, this.email});
}

final form = UserForm(username: '', email: null);
final errors = form.validate();
```

## 📦 Supported Validators

| Annotation        | Description                             |
|------------------|-----------------------------------------|
| `@Required`       | Field must not be null or empty         |
| `@MinLength(n)`   | String must be at least `n` characters  |
| `@MaxLength(n)`   | String must be at most `n` characters   |
| `@Range(a, b)`    | Number must be between `a` and `b`      |
| `@Regex(pattern)` | String must match the regex             |
| `@Equals(value)`  | Must equal the specified value          |

> ✅ All validators support an optional  `message:` parameter for custom error output.

---

## 🛠 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  nice_validator:

dev_dependencies:
  build_runner:
  nice_validator_generator:
```

Then run:

```bash
dart run build_runner build
```

---

## 📌 Notes

- The model class must use `@FormModel()`
- No runtime reflection — Flutter safe

---

## 👨‍💻 Author

Built with ❤️ by [Saket Kumar](https://github.com/voonic)

---

## 🪪 License

MIT License
