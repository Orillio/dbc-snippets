import '../annotation.dart';

@Contract()
class ShoppingCart {
  List<String> items = [];

  @Postcondition({
    'items.contains(item)': 'The item must be present in the cart.',
  })
  void _addItem(String item) {
    items.add(item);
  }
}
