class InvalidCredentialException implements Exception {
  final String message;

  InvalidCredentialException({required this.message});

  @override
  String toString() => message;
}

class ServerException implements Exception {
  final String message;

  ServerException({required this.message});
  @override
  String toString() => message;
}

class CashedException implements Exception {
  final String message;

  CashedException({required this.message});
  @override
  String toString() => message;
}

class NetworkException implements Exception {
  final String message;

  NetworkException({required this.message});
  @override
  String toString() => message;
}
