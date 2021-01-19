import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:spa_coding_exercise/data/network/network_info.dart';

class WebNetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected => Future.value(true);

  @override
  Stream<DataConnectionStatus> get onStatusChange => const Stream.empty();
}
