import '../annotation.dart';

@Contract()
class Wallet {
  int _balance = 0;
  int get balance => _balance;

  @Postcondition({
    'balance >= 0': 'The balance must remain non-negative.',
    'result == balance': 'The returned balance must match the internal balance.',
  })
  int _deposit(int amount) {
    _balance += amount;
    return balance;
  }
}
