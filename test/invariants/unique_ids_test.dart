import 'package:dbc_snippets/invariants/unique_ids.dart';
import 'package:test/test.dart';

void main() {
  group('IDManager Contract Tests', () {
    late IDManager idManager;

    setUp(() {
      idManager = IDManager();
    });

    test('Invariant is upheld when adding unique IDs', () {
      idManager.addId(1);
      idManager.addId(2);
      idManager.addId(3);

      expect(idManager.uniqueIds, equals([1, 2, 3]),
          reason: 'IDs should be added successfully.');
      expect(
        idManager.uniqueIds.length == idManager.uniqueIds.toSet().length,
        isTrue,
        reason: 'All IDs must be unique after adding new IDs.',
      );
    });

    test('Invariant fails when adding duplicate IDs', () {
      idManager.addId(1);
      idManager.addId(2);

      expect(
        () => idManager.addId(1),
        throwsA(predicate((e) =>
            e is AssertionError &&
            e.message == 'All IDs must be unique.')),
      );
    });

    test('Invariant is upheld when removing existing IDs', () {
      idManager.addId(1);
      idManager.addId(2);
      idManager.addId(3);
      idManager.removeId(2);

      expect(idManager.uniqueIds, equals([1, 3]),
          reason: 'ID should be removed successfully.');
      expect(
        idManager.uniqueIds.length == idManager.uniqueIds.toSet().length,
        isTrue,
        reason: 'All IDs must remain unique after removal.',
      );
    });

    test('Invariant is upheld when removing non-existent IDs', () {
      idManager.addId(1);
      idManager.addId(2);

      idManager.removeId(3); 

      expect(idManager.uniqueIds, equals([1, 2]),
          reason: 'Removing a non-existent ID should not alter the list.');
      expect(
        idManager.uniqueIds.length == idManager.uniqueIds.toSet().length,
        isTrue,
        reason: 'All IDs must remain unique after attempting to remove a non-existent ID.',
      );
    });

    test('Invariant fails if internal list is manually altered to contain duplicates', () {
      idManager.addId(1);
      idManager.addId(2);

      idManager.uniqueIds.add(1);

      expect(
        () => idManager.addId(3), 
        throwsA(predicate((e) =>
            e is AssertionError &&
            e.message == 'All IDs must be unique.')),
      );
    });
  });
}