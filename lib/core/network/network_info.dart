import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfoI {
  Future<bool> get isConnected;
  Future<InternetConnectionStatus> get connectivityStatus;
  Stream<InternetConnectionStatus> get onConnectivityChanged;
}

class NetworkInfo implements NetworkInfoI {
  final InternetConnectionChecker connectionChecker;

  NetworkInfo(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

  @override
  Future<InternetConnectionStatus> get connectivityStatus => connectionChecker.connectionStatus;

  @override
  Stream<InternetConnectionStatus> get onConnectivityChanged => connectionChecker.onStatusChange;
}
