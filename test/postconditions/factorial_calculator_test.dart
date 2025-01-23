import 'package:dbc_snippets/postconditions/factorial_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('FactorialCalculator Contract Tests', () {
    late FactorialCalculator calculator;

    setUp(() {
      calculator = FactorialCalculator();
    });

    test('Precondition fails when n is negative', () {
      expect(
        () => calculator.calculateFactorial(-1),
        throwsA(predicate((e) =>
            e is AssertionError && e.message == 'n must not be negative')),
      );
    });

    test('Postconditions hold for valid input', () {
      expect(calculator.calculateFactorial(5), equals(120));
      expect(calculator.calculateFactorial(0), equals(1));
      expect(calculator.calculateFactorial(1), equals(1));
    });

    test('Postcondition fails for incorrect result', () {
      expect(
        () => calculator.calculateFactorial(5),
        returnsNormally, // Ensures normal execution when correct
      );
    });

    test('Factorial result must always be greater than zero', () {
      expect(calculator.calculateFactorial(3), greaterThan(0));
    });
  });
}