import 'package:dbc_snippets/postconditions/square_root.dart';
import 'package:test/test.dart';

void main() {
  group('Calculator Contract Tests', () {
    late Calculator calculator;

    setUp(() {
      calculator = Calculator();
    });

    test('Postcondition: The square root should be non-negative', () {
      double number = 4;
      double result = calculator.sqrt(number);

      expect(result, greaterThanOrEqualTo(0));
    });

    test('Postcondition fails for negative number', () {
      double number = -1;
      double result = calculator.sqrt(number);

      expect(result, equals(0));
    });
  });
}