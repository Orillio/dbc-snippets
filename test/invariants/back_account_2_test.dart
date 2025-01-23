import 'package:dbc_snippets/invariants/bank_account_2.dart';
import 'package:test/test.dart';

void main() {
  group('Account Contract Tests', () {
    late Account account;

    setUp(() {
      account = Account();
    });

    test('Invariant is upheld when resetting balance', () {
      account.deposit(100);
      expect(account.balance, equals(100),
          reason: 'Balance should be set to 100.');
      account.resetBalance();

      expect(account.balance, equals(0),
          reason: 'Balance should be reset to 0.');
    });

    test('Precondition fails when depositing a negative amount', () {
      expect(
        () => account.deposit(-50),
        throwsA(predicate((e) =>
            e is AssertionError &&
            e.message == 'Deposit amount must be positive.')),
      );
    });

    test('Deposit increases balance correctly', () {
      account.deposit(100);
      expect(account.balance, equals(100),
          reason: 'Balance should reflect the deposit.');
    });

    test('Postcondition when balance matches returned result', () {
      account.deposit(100);
      expect(account.withdraw(30), equals(account.balance));
    });

    test('Withdraw decreases balance correctly', () {
      account.deposit(100);
      final newBalance = account.withdraw(50);
      expect(newBalance, equals(50),
          reason: 'Balance should be updated after withdrawal.');
      expect(account.balance, equals(50),
          reason: 'Internal balance should match the returned value.');
    });

    test('Invariant fails when balance becomes negative', () {
      account.deposit(100);
      expect(
        () => account.withdraw(150),
        throwsA(predicate((e) =>
            e is AssertionError &&
            e.message == 'The balance must never be negative.')),
      );
    });
  });
}
