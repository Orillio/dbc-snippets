import 'package:dbc_snippets/preconditions/matrix.dart';
import 'package:test/test.dart';

void main() {
  group('Matrix Contract Tests', () {
    late Matrix matrix1;

    setUp(() {
      matrix1 = Matrix([
        [1.0, 2.0],
        [3.0, 4.0]
      ]);
    });

    test('Precondition: Matrices must have the same dimensions for addition',
        () {
      Matrix matrix3 = Matrix([
        [9.0, 10.0],
        [11.0, 12.0]
      ]);

      expect(() => matrix1.add(matrix3), returnsNormally);
    });

    test(
        'Precondition: Matrices must have compatible dimensions for multiplication',
        () {
      Matrix matrix4 = Matrix([
        [1.0, 2.0],
        [3.0, 4.0]
      ]);

      expect(() => matrix1.multiply(matrix4), returnsNormally);
    });

    test(
        'Precondition: Matrices with incompatible dimensions for multiplication',
        () {
      Matrix matrix5 = Matrix([
        [1.0, 2.0]
      ]);

      expect(() => matrix1.multiply(matrix5), throwsA(isA<AssertionError>()));
    });

    test(
        'Precondition: Matrices with different dimensions for addition (should fail)',
        () {
      Matrix matrix6 = Matrix([
        [1.0, 2.0, 3.0]
      ]);

      expect(() => matrix1.add(matrix6), throwsA(isA<AssertionError>()));
    });

    test(
        'Precondition: Matrices with incompatible dimensions for multiplication (should fail)',
        () {
      Matrix matrix7 = Matrix([
        [1.0]
      ]);

      expect(() => matrix1.multiply(matrix7), throwsA(isA<AssertionError>()));
    });
  });
}
