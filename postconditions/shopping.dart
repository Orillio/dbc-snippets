import '../annotation.dart';

@Contract()
class ShoppingCart {
  final List<String> _items = [];
  List<String> get items => _items;

  @Postcondition({
    'items.contains(item)': 'The item must be present in the cart.',
  })
  void _addItem(String item) {
    items.add(item);
  }
}
