// This one is to ensure that invariant checks are triggered by precondition and postcondition annotations, too.

import '../annotation.dart';

@Contract({
  'balance >= 0': 'The balance must never be negative.',
})
class Account {
  int balance = 0;

  @Invariant()
  void _resetBalance() {
    balance = 0;
  }

  @Precondition({
    'amount > 0': 'Deposit amount must be positive.',
  })
  void _deposit(int amount) {
    balance += amount;
  }

  @Postcondition({
    'result == balance': 'The returned balance must match the internal balance.',
  })
  void _withdraw(double amount) {
    _balance -= amount;
  }
}
