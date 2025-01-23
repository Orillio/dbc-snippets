import 'package:dbc_snippets/invariants/bank_account.dart';
import 'package:test/test.dart';

void main() {
  group('BankAccount Contract Tests', () {
    late BankAccount account;

    setUp(() {
      account = BankAccount(100.0, -500.0);
    });

    test('Invariant is upheld when depositing money', () {
      account.deposit(50.0);
      expect(account.balance, equals(150.0),
          reason: 'Balance should reflect the deposit and stay above overdraft limit.');
    });

    test('Invariant fails when balance goes below overdraft limit', () {
      expect(
        () => account.withdraw(700.0),
        throwsA(predicate((e) =>
            e is AssertionError &&
            e.message == 'Balance must not be less than the overdraft limit.')),
      );
    });

    test('Invariant is upheld when resetting the account', () {
      account.resetAccount();
      expect(account.balance, equals(0.0), reason: 'Balance should be reset to 0.');
    });

    test('Invariant fails after multiple withdrawals exceed overdraft limit', () {
      account.withdraw(100.0);
      expect(
        () => account.withdraw(600.0),
        throwsA(predicate((e) =>
            e is AssertionError &&
            e.message == 'Balance must not be less than the overdraft limit.')),
      );
    });

    test('Invariant is upheld when performing multiple valid operations', () {
      account.deposit(200.0);
      account.withdraw(150.0); 
      expect(account.balance, equals(150.0),
          reason: 'Balance should correctly reflect multiple operations while adhering to the invariant.');
    });
  });
}