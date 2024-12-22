// ignore_for_file: unused_element

import 'package:design_by_contract/annotation.dart';

@Contract()
class UserRegistration {
  @Precondition({
    'username.isNotEmpty': 'Username must not be empty.',
    'username.length <= 15': 'Username must be 15 characters or fewer.',
    'email.contains("@")': 'Email must contain an "@" symbol.',
    'password.length >= 8': 'Password must be at least 8 characters long.',
  })
  void _registerUser(String username, String email, String password) {
    // Registration logic
  }
}
