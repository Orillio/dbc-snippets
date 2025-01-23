import 'package:dbc_snippets/preconditions/password_validator.dart';
import 'package:test/test.dart';

void main() {
  group('PasswordValidator Contract Tests', () {
    late PasswordValidator passwordValidator;

    setUp(() {
      passwordValidator = PasswordValidator();
    });

    test('Precondition: Password length is sufficient', () {
      expect(
        () => passwordValidator.validatePassword("Strong123"),
        returnsNormally,
      );
    });

    test('Precondition: Password contains an uppercase letter', () {
      testFunction() => passwordValidator.validatePassword("strong123");
      expect(
        testFunction,
        throwsA(
          isA<AssertionError>().having(
            (e) => e.toString(),
            'error message',
            contains('Password must contain at least one uppercase letter.'),
          ),
        ),
      );
    });

    test('Precondition: Password contains a lowercase letter', () {
      testFunction() => passwordValidator.validatePassword("STRONG123");
      expect(
        testFunction,
        throwsA(
          isA<AssertionError>().having(
            (e) => e.toString(),
            'error message',
            contains('Password must contain at least one lowercase letter.'),
          ),
        ),
      );
    });

    test('Precondition: Password contains a digit', () {
      testFunction() => passwordValidator.validatePassword("StrongPass");
      expect(
        testFunction,
        throwsA(
          isA<AssertionError>().having(
            (e) => e.toString(),
            'error message',
            contains('Password must contain at least one digit.'),
          ),
        ),
      );
    });

    test('Precondition: Password does not meet any requirements (should fail)',
        () {
      testFunction() => passwordValidator.validatePassword("short");
      expect(
        testFunction,
        throwsA(
          isA<AssertionError>().having(
            (e) => e.toString(),
            'error message',
            contains('Password must be at least 8 characters long.'),
          ),
        ),
      );
    });
  });
}
