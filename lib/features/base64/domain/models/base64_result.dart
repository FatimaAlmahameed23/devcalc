sealed class Base64Result {
  const Base64Result();
}

class Base64Success extends Base64Result {
  final String result;

  const Base64Success(this.result);
}

class Base64Failure extends Base64Result {
  final String errorMessage;

  const Base64Failure(this.errorMessage);
}
