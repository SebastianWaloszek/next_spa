import 'package:spa_coding_exercise/data/network/request.dart';

abstract class NetworkService {
  Future<dynamic> make<T>(Request<T> request);
}
