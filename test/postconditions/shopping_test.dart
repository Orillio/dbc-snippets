import 'package:dbc_snippets/postconditions/shopping.dart';
import 'package:test/test.dart';

void main() {
  group('ShoppingCart Contract Tests', () {
    late ShoppingCart shoppingCart;

    setUp(() {
      shoppingCart = ShoppingCart();
    });

    test('Postcondition: Item should be added to the cart', () {
      String item = 'Apple';
      shoppingCart.addItem(item);

      expect(shoppingCart.items.contains(item), isTrue);
    });

    test('Postcondition fails if item is not added', () {
      String item = 'Banana';
      shoppingCart.addItem(item);

      expect(shoppingCart.items.contains(item),
          isTrue); 
    });
  });
}
