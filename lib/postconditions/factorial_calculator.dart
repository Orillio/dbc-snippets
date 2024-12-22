// ignore_for_file: unused_element

import 'package:design_by_contract/annotation.dart';

@Contract()
class FactorialCalculator {
  @Postcondition({
    'result > 0': 'Factorial result must be greater than zero.',
    'result == _expectedFactorial(n)': 'Result must match the expected factorial value.',
  })
  int _calculateFactorial(int n) {
    if (n == 0 || n == 1) return 1;
    return n * _calculateFactorial(n - 1);
  }

  int _expectedFactorial(int n) {
    // A method that calculates the expected factorial value iteratively.
    int result = 1;
    for (int i = 1; i <= n; i++) {
      result *= i;
    }
    return result;
  }
}