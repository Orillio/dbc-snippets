import '../annotation.dart';

@Contract()
class Terminate {

  @Postcondition({
    'true': 'Something is wrong! Check Postcondition logic, please!',
  })
  void _nothing() {
    // Method does nothing
  }
}
