/// Use this annotation to declare a class as a contract.
///
/// A contract is a set of rules (invariants) that the class must adhere to.
/// These invariants are conditions that must always hold true before and after
/// each call to any annotated public method of the class.
///
/// [invariantAsserts] is an optional map where:
/// - **Key**: A string representing a condition (a valid Dart expression).
/// - **Value**: A string containing an assertion message that describes what the condition enforces.
///
/// Example:
/// ```dart
/// @Contract({
///   'balance >= 0': 'The balance must never be negative.',
/// })
/// class Wallet {
///   int balance = 0;
///
///   // Deposit money into the wallet.
///   // Preconditions ensure valid input.
///   // Postconditions ensure the balance is updated correctly.
///   @Precondition({
///     'amount > 0': 'The deposit amount must be greater than zero.',
///   })
///   @Postcondition({
///     'balance == result': 'The returned balance must match the internal balance.',
///   })
///   int deposit(int amount) {
///     balance += amount;
///     return balance;
///   }
///
///   // Withdraw money from the wallet.
///   // Preconditions ensure sufficient funds.
///   // Postconditions ensure the balance is updated correctly.
///   @Precondition({
///     'amount > 0': 'The withdrawal amount must be greater than zero.',
///     'balance >= amount': 'Insufficient balance.',
///   })
///   @Postcondition({
///     'balance == result': 'The returned balance must match the internal balance.',
///   })
///   int withdraw(int amount) {
///     balance -= amount;
///     return balance;
///   }
/// }
/// ```
///
/// When a class is annotated with `@Contract`, the specified invariants are automatically
/// checked **before** and **after** each annotated public method call.
/// - If a condition evaluates to `false`, an error is raised with the associated assertion message.
/// - To enforce invariants, methods must be explicitly annotated (either with `@Invariant()`, `@Postcondition()` or `@Precondition()`).
class Contract {
  const Contract(this.invariantAsserts);

  /// A map of conditions and their corresponding assertion messages.
  ///
  /// - **Key**: A Dart expression as a string, representing the condition.
  /// - **Value**: A human-readable message that describes the assertion.
  final Map<String, String>? invariantAsserts;
}

/// Use this annotation to specify preconditions for a public method.
///
/// Preconditions are conditions that must be satisfied **before** the method is executed.
/// These conditions ensure that the inputs or state of the system meet the required criteria
/// for the method to execute safely and correctly.
///
/// [asserts] is a map where:
/// - **Key**: A string representing a condition (a valid Dart expression).
/// - **Value**: A string containing an assertion message that describes what the condition enforces.
///
/// If any of the preconditions are violated (i.e., a condition evaluates to `false`),
/// an error is raised with the corresponding assertion message.
///
/// Example:
/// ```dart
/// @Precondition({
///   'amount > 0': 'Deposit amount must be greater than zero.',
///   'balance + amount <= maxLimit': 'Balance must not exceed the maximum limit.',
/// })
/// void deposit(int amount) {
///   balance += amount;
/// }
/// ```
class Precondition {
  const Precondition(this.asserts);

  /// A map of conditions and their corresponding assertion messages.
  ///
  /// - **Key**: A Dart expression as a string, representing the condition.
  /// - **Value**: A human-readable message that describes the assertion.
  final Map<String, String> asserts;
}

/// Use this annotation to specify postconditions for a public method.
///
/// Postconditions are conditions that must be satisfied **after** the method is executed.
/// These conditions validate the method's outcome, ensuring that the method's effects
/// or returned results adhere to expectations.
///
/// [asserts] is a map where:
/// - **Key**: A string representing a condition (a valid Dart expression). 
///   The condition can include a special variable `result`, which represents the value returned by the method.
/// - **Value**: A string containing an assertion message that describes what the condition enforces.
///
/// If any of the postconditions are violated (i.e., a condition evaluates to `false`),
/// an error is raised with the corresponding assertion message.
///
/// Example:
/// ```dart
/// @Postcondition({
///   'result >= 0': 'The result must be non-negative.',
///   'result % 2 == 0': 'The result must be an even number.',
/// })
/// int calculateDouble(int input) {
///   return input * 2;
/// }
/// ```
class Postcondition {
  const Postcondition(this.asserts);

  /// A map of conditions and their corresponding assertion messages.
  ///
  /// - **Key**: A Dart expression as a string, representing the condition.
  /// - **Value**: A human-readable message that describes the assertion.
  final Map<String, String> asserts;
}
/// Use this annotation to enforce class-level invariants on a public method.
///
/// The `@Invariant` annotation ensures that the invariants specified in the `@Contract` annotation
/// are checked **before** and **after** the execution of the annotated method.
///
/// This annotation is intended for methods that do not have explicit `@Precondition` or `@Postcondition` annotations.
/// It does not specify its own conditions but ensures the class-level invariants are upheld.
///
/// If any invariant condition is violated (i.e., a condition in the `@Contract` annotation evaluates to `false`),
/// an error is raised with the corresponding assertion message.
///
/// Example:
/// ```dart
/// @Contract({
///   'balance >= 0': 'Balance must never be negative.',
///   'transactions.length <= maxTransactionLimit': 'Transaction count must not exceed the maximum limit.',
/// })
/// class BankAccount {
///   int balance = 0;
///   final int maxTransactionLimit = 100;
///   final List<String> transactions = [];
///
///   @Invariant()
///   void deposit(int amount) {
///     balance += amount;
///     transactions.add('Deposit $amount');
///   }
///
///   @Invariant()
///   void withdraw(int amount) {
///     balance -= amount;
///     transactions.add('Withdraw $amount');
///   }
/// }
/// ```
///
/// ### Key Notes:
/// - `@Invariant` applies the invariants declared in the `@Contract` annotation.
/// - This annotation is used for methods that do **not** have `@Precondition` or `@Postcondition` annotations.
/// - Invariants are checked **before** and **after** the execution of the annotated method.
/// - It does not take any arguments or specify additional conditions.
class Invariant {
  const Invariant();
}

final Invariant invariant = Invariant();
