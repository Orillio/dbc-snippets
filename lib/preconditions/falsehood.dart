import 'package:design_by_contract/annotation.dart';

part 'falsehood.g.dart';

@Contract()
class Falsehood {

  @Precondition({
    'false': 'From falsehood, anything follows!',
  })
  void _f() {
    print("Shouldn't have come here!");
  }
}
