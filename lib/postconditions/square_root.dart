import 'dart:math';
import 'package:design_by_contract/annotation.dart';

@Contract()
class Calculator {
  @Postcondition({
    'result >= 0': 'The square root must be non-negative.',
  })
  double _sqrt(double number) {
    return number >= 0 ? sqrt(number) : 0; 
  }
}
