import 'package:spa_coding_exercise/data/network/network_service.dart';
import 'package:spa_coding_exercise/data/network/request.dart';

abstract class NetworkServiceDecorator implements NetworkService {
  final NetworkService networkService;

  const NetworkServiceDecorator(this.networkService);

  @override
  Future make<T>(Request<T> request) {
    return networkService.make<T>(request);
  }
}
