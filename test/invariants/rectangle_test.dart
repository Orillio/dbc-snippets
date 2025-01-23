import 'package:dbc_snippets/invariants/rectangle.dart';
import 'package:test/test.dart';

void main() {
  group('Rectangle Contract Tests', () {
    late Rectangle rectangle;

    setUp(() {
      rectangle = Rectangle(10.0, 20.0);
    });

    test('Invariant is upheld when scaling with a positive factor', () {
      rectangle.scale(2.0);
      expect(rectangle.width, equals(20.0),
          reason: 'Width should be doubled after scaling.');
      expect(rectangle.height, equals(40.0),
          reason: 'Height should be doubled after scaling.');
    });

    test('Invariant fails when scaling with a negative factor', () {
      expect(
        () => rectangle.scale(-1.0),
        throwsA(predicate((e) =>
            e is AssertionError &&
            e.message == 'Width must be non-negative.')),
      );
    });

    test('Invariant is upheld when setting a valid new width', () {
      rectangle.setWidth(15.0);
      expect(rectangle.width, equals(15.0),
          reason: 'Width should be updated to the new value.');
    });

    test('Invariant fails when setting a negative width', () {
      expect(
        () => rectangle.setWidth(-5.0),
        throwsA(predicate((e) =>
            e is AssertionError &&
            e.message == 'Width must be non-negative.')),
      );
    });

    test('Invariant is upheld when setting a valid new height', () {
      rectangle.setHeight(25.0);
      expect(rectangle.height, equals(25.0),
          reason: 'Height should be updated to the new value.');
    });

    test('Invariant fails when setting a negative height', () {
      expect(
        () => rectangle.setHeight(-10.0),
        throwsA(predicate((e) =>
            e is AssertionError &&
            e.message == 'Height must be non-negative.')),
      );
    });

    test('Invariant is upheld for multiple valid operations', () {
      rectangle.scale(1.5); 
      rectangle.setWidth(12.0); 
      rectangle.setHeight(18.0); 
      expect(rectangle.width, equals(12.0),
          reason: 'Width should reflect the last valid operation.');
      expect(rectangle.height, equals(18.0),
          reason: 'Height should reflect the last valid operation.');
    });
  });
}