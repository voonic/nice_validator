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
@FormModel()
class ExerciseForm with _$ExerciseFormValidation {
  @Required(message: 'Name is required')
  @MinLength(3)
  final String? name;

  @Required()
  final ExerciseType? type;

  final String? equipment;
}

final form = ExerciseForm(name: '', type: null);
final errors = form.validate();
```

**Generated output:**

```dart
mixin _$ExerciseFormValidation {
  Map<String, String> validate() {
    final errors = <String, String>{};
    if (name == null || name!.trim().isEmpty) {
      errors['name'] = 'Name is required';
    } else if (name!.length < 3) {
      errors['name'] = 'Minimum 3 characters';
    }
    if (type == null) {
      errors['type'] = 'This field is required';
    }
    return errors;
  }
}
```

---

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
- You must mix in the generated validator mixin: `with _$YourClassValidation`
- No runtime reflection — Flutter safe

---

## 💡 Roadmap

- [ ] Support nested object validation
- [ ] Add `.build()` for model transformation
- [ ] Aggregated error objects / exceptions

---

## 👨‍💻 Author

Built with ❤️ by [Saket Kumar](https://github.com/voonic)

---

## 🪪 License

MIT License
