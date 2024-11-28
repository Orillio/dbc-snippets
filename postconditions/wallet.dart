import '../annotation.dart';

@Contract()
class Wallet {
  int balance = 0;

  @Postcondition({
    'balance >= 0': 'The balance must remain non-negative.',
    'result == balance': 'The returned balance must match the internal balance.',
  })
  int _deposit(int amount) {
    balance += amount;
    return balance;
  }
}
