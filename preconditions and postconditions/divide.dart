import '../annotation.dart';

@Contract()
class Calculator {
  @Precondition({
    'b != 0': 'Denominator must not be zero.',
  })
  @Postcondition({
    'true' : 'Precondition has a problem and divided by 0!',
  })
  double _divide(double a, double b) {
    return a / b;
  }
}
