import 'package:design_by_contract/annotation.dart';

@Contract()
class ListSorter {
  @Postcondition({
    '_isSorted(result)': 'The returned list must be sorted in ascending order.',
  })
  List<int> _sortList(List<int> unsortedList) {
    List<int> sortedList = List.from(unsortedList);
    sortedList.sort();
    return sortedList;
  }

  bool _isSorted(List<int> list) {
    for (int i = 0; i < list.length - 1; i++) {
      if (list[i] > list[i + 1]) {
        return false;
      }
    }
    return true;
  }
}