import '../annotation.dart';

@Contract()
class Falsehood {

  @Precondition({
    'false': 'From falsehood, anything follows!',
  })
  void _false() {
    print("Shouldn't have come here!");
  }
}
