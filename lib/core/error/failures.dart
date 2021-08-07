import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object> get props => [];
}

// General failures
class CacheFailure extends Failure {
  final String message;

  const CacheFailure({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'CacheFailure { message: $message }';
}

class ServerFailure extends Failure {
  final String message;

  const ServerFailure({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'ServerFailure { message: $message }';
}

class DioFailure extends Failure {
  final String message;

  const DioFailure({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'DioFailure { message: $message }';
}
