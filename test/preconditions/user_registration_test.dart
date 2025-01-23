import 'package:dbc_snippets/preconditions/user_registration.dart';
import 'package:test/test.dart';

void main() {
  group('UserRegistration Contract Tests', () {
    late UserRegistration userRegistration;

    setUp(() {
      userRegistration = UserRegistration();
    });

    test('Precondition: Username is not empty', () {
      testFunction() =>
          userRegistration.registerUser("", "test@example.com", "Password123");
      expect(
          testFunction,
          throwsA(isA<AssertionError>().having((e) => e.toString(),
              'error message', contains('Username must not be empty.'))));
    });

    test('Precondition: Username length is <= 15', () {
      testFunction() => userRegistration.registerUser(
          "ThisIsAReallyLongUsername", "test@example.com", "Password123");
      expect(
          testFunction,
          throwsA(isA<AssertionError>().having(
              (e) => e.toString(),
              'error message',
              contains('Username must be 15 characters or fewer.'))));
    });

    test('Precondition: Email contains "@" symbol', () {
      testFunction() => userRegistration.registerUser(
          "username", "invalidemail", "Password123");
      expect(
          testFunction,
          throwsA(isA<AssertionError>().having((e) => e.toString(),
              'error message', contains(r'Email must contain an \"@\" symbol.'))));
    });

    test('Precondition: Password is at least 8 characters long', () {
      testFunction() => userRegistration.registerUser(
          "username", "test@example.com", "short");
      expect(
          testFunction,
          throwsA(isA<AssertionError>().having(
              (e) => e.toString(),
              'error message',
              contains('Password must be at least 8 characters long.'))));
    });

    test('Valid Registration: All preconditions passed', () {
      expect(
          () => userRegistration.registerUser(
              "username", "test@example.com", "Password123"),
          returnsNormally);
    });
  });
}
