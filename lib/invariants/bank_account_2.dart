// This one is to ensure that invariant checks are triggered by precondition and postcondition annotations, too.

// ignore_for_file: unused_element

import 'package:design_by_contract/annotation.dart';

@Contract({
  'balance >= 0': 'The balance must never be negative.',
})
class Account {
  int _balance = 0;
  int get balance => _balance;

  @Invariant()
  void _resetBalance() {
    _balance = 0;
  }

  @Precondition({
    'amount > 0': 'Deposit amount must be positive.',
  })
  void _deposit(int amount) {
    _balance += amount;
  }

  @Postcondition({
    'result == balance': 'The returned balance must match the internal balance.',
  })
  void _withdraw(int amount) {
    _balance -= amount;
  }
}
