import 'package:design_by_contract/annotation.dart';

@Contract()
class Greetings {

  @Precondition({
    'true': 'Not a happy world!',
  })
  void _hello() {
    print("Hello World!");
  }
}
