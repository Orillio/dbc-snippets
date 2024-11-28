import '../annotation.dart';

@Contract()
class Terminate {

  @Postcondition({
    'true': 'Hooray! Program terminated Successfully!!',
  })
  void _nothing() {
    // Method does nothing
  }
}
