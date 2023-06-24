import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class InternetInfo {
  Future<bool> get isConnected;
}

class InternetInfoImpl implements InternetInfo {
  final InternetConnectionChecker _internetConnectionChecker =
      InternetConnectionChecker();
  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;
}
