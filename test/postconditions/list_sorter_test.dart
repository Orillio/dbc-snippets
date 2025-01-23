import 'package:dbc_snippets/postconditions/list_sorter.dart';
import 'package:test/test.dart';

void main() {
  group('ListSorter Contract Tests', () {
    late ListSorter listSorter;

    setUp(() {
      listSorter = ListSorter();
    });

    test('Postcondition: List is sorted in ascending order', () {
      List<int> unsortedList = [5, 2, 8, 1, 3];
      List<int> sortedList = listSorter.sortList(unsortedList);

      expect(listSorter.isSorted(sortedList), isTrue);
    });

    test('Postcondition: Sorted list should remain sorted', () {
      List<int> unsortedList = [10, 7, 3, 2];
      List<int> sortedList = listSorter.sortList(unsortedList);

      expect(sortedList, orderedEquals([2, 3, 7, 10]));
      expect(listSorter.isSorted(sortedList), isTrue);
    });

    test('Postcondition fails if list is not sorted', () {
      List<int> unsortedList = [9, 1, 6, 4];
      List<int> result = listSorter.sortList(unsortedList);
      
      expect(
        listSorter.isSorted(result),
        isTrue,
      );
    });
  });
}