// ignore_for_file: unused_element

import 'package:design_by_contract/annotation.dart';

part 'password_validator.g.dart';


@Contract()
class PasswordValidator {
  @Precondition({
    'password.length >= 8': 'Password must be at least 8 characters long.',
    'password.contains(RegExp(r"[A-Z]"))':
        'Password must contain at least one uppercase letter.',
    'password.contains(RegExp(r"[a-z]"))':
        'Password must contain at least one lowercase letter.',
    'password.contains(RegExp(r"[0-9]"))':
        'Password must contain at least one digit.',
  })
  bool _validatePassword(String password) {
    // Password is considered valid if it passes all preconditions.
    return true;
  }
}
