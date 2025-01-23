import 'package:dbc_snippets/postconditions/wallet.dart';
import 'package:test/test.dart';

void main() {
  group('Wallet Contract Tests', () {
    late Wallet wallet;

    setUp(() {
      wallet = Wallet();
    });

    test('Postcondition: The balance must remain non-negative after deposit',
        () {
      int depositAmount = 50;
      int result = wallet.deposit(depositAmount);

      expect(result, greaterThanOrEqualTo(0));
      expect(result, equals(wallet.balance));
    });

    test('Postcondition: The balance should match the result after deposit',
        () {
      int depositAmount = 30;
      int result = wallet.deposit(depositAmount);

      expect(result, equals(wallet.balance));
    });
  });
}
