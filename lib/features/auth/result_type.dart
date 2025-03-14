sealed class Result<T> {}

class Success<T> extends Result<T> {
  final String userId;
  final String username;

  Success(this.userId, this.username);
}

class Failure<T> extends Result<T> {
  final String message;

  Failure(this.message);
}