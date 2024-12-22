import 'package:design_by_contract/annotation.dart';

part 'teminate.g.dart';

@Contract()
class Terminate {

  @Postcondition({
    'true': 'Something is wrong! Check Postcondition logic, please!',
  })
  void _nothing() {
    // Method does nothing
  }
}
