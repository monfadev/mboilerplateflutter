class ServerException implements Exception {
  final String message;

  ServerException({required this.message});

  @override
  String toString() {
    return 'ServerException: $message';
  }
}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);

  @override
  String toString() => 'DatabaseException: $message';
}
