import 'package:design_by_contract/annotation.dart';

@Contract()
class MathUtils {
  @Precondition({
    'list.isNotEmpty': 'Input list must not be empty.',
  })
  @Postcondition({
    'list.contains(result)': 'The result must be an element of the list.',
  })
  int _findMax(List<int> list) {
    return list.reduce((a, b) => a > b ? a : b);
  }
}
