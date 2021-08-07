class CacheFailure implements Exception {
  final String message;

  const CacheFailure(this.message);

  List<Object> get props => [message];

  @override
  String toString() => 'CacheFailure { message: $message }';
}

class ServerFailure implements Exception {
  final String message;

  const ServerFailure(this.message);

  List<Object> get props => [message];

  @override
  String toString() => 'ServerFailure { message: $message }';
}
