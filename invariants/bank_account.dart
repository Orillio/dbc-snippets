// ignore_for_file: unused_field, unused_element

import '../annotation.dart';

@Contract({
  '_balance >= overdraftLimit': 'Balance must not be less than the overdraft limit.',
})
class BankAccount {
  double _balance;
  final double overdraftLimit;

  @Invariant()
  BankAccount._(this._balance, this.overdraftLimit);

  @Invariant()
  void _deposit(double amount) {
    _balance += amount;
  }

  @Invariant()
  void _withdraw(double amount) {
    _balance -= amount;
  }

  @Invariant()
  void _resetAccount() {
    _balance = 0.0;
  }
}