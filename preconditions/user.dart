@Contract()
class User {
  final String username;
  final int age;

  @Precondition({
    'username.isNotEmpty': 'Username must not be empty.',
    'age > 0': 'Age must be positive.',
  })
  User._(this.username, this.age);
}
