import 'package:dbc_snippets/invariants/time_period.dart';
import 'package:test/test.dart';

void main() {
  group('TimePeriod Contract Tests', () {
    late TimePeriod timePeriod;

    setUp(() {
      timePeriod = TimePeriod();
    });

    test('Invariant is upheld when updating start to a valid value', () {
      timePeriod.updateStart(5);
      expect(timePeriod.start, equals(5),
          reason: 'Start should be updated to the new value.');
      expect(timePeriod.end, greaterThan(timePeriod.start),
          reason: 'Invariant should hold after updating start.');
    });

    test('Invariant fails when updating start to a value greater than or equal to end', () {
      expect(
        () => timePeriod.updateStart(10),
        throwsA(predicate((e) =>
            e is AssertionError &&
            e.message == 'End must be greater than start.')),
      );

      expect(
        () => timePeriod.updateStart(15),
        throwsA(predicate((e) =>
            e is AssertionError &&
            e.message == 'End must be greater than start.')),
      );
    });

    test('Invariant is upheld when updating end to a valid value', () {
      timePeriod.updateEnd(20);
      expect(timePeriod.end, equals(20),
          reason: 'End should be updated to the new value.');
      expect(timePeriod.end, greaterThan(timePeriod.start),
          reason: 'Invariant should hold after updating end.');
    });

    test('Invariant fails when updating end to a value less than or equal to start', () {
      expect(
        () => timePeriod.updateEnd(0),
        throwsA(predicate((e) =>
            e is AssertionError &&
            e.message == 'End must be greater than start.')),
      );

      expect(
        () => timePeriod.updateEnd(5),
        throwsA(predicate((e) =>
            e is AssertionError &&
            e.message == 'End must be greater than start.')),
      );
    });

    test('Invariant is upheld for multiple valid updates', () {
      timePeriod.updateStart(2); 
      timePeriod.updateEnd(15); 
      expect(timePeriod.start, equals(2),
          reason: 'Start should reflect the last valid update.');
      expect(timePeriod.end, equals(15),
          reason: 'End should reflect the last valid update.');
      expect(timePeriod.end, greaterThan(timePeriod.start),
          reason: 'Invariant should hold after multiple updates.');
    });
  });
}