import 'package:design_by_contract/annotation.dart';

@Contract({
  'uniqueIds.length == uniqueIds.toSet().length': 'All IDs must be unique.',
})
class IDManager {
  final List<int> uniqueIds = [];

  @Invariant()
  void _addId(int id) {
    uniqueIds.add(id);
  }

  @Invariant()
  void _removeId(int id) {
    uniqueIds.remove(id);
  }
}
