import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:spa_coding_exercise/common/environment/environment.dart';
import 'package:spa_coding_exercise/data/network/http_method.dart';
import 'package:spa_coding_exercise/data/network/network_service.dart';
import 'package:spa_coding_exercise/data/network/request.dart';
import 'package:spa_coding_exercise/data/network/request_exceptions.dart';

class NetworkServiceImpl implements NetworkService {
  final Dio dio;

  const NetworkServiceImpl({
    @required this.dio,
  }) : assert(dio != null);

  Map<String, dynamic> get _accessTokenParameter {
    return {
      'access_token': Environment.current.accessToken,
    };
  }

  @override
  Future<dynamic> make<T>(Request<T> request) async {
    try {
      final response = await dio.request(
        request.path,
        options: Options(
          method: request.method.getMethodString(),
        ),
        queryParameters: (request.queryParameters ?? {})
          ..addAll(_accessTokenParameter),
        data: request.body?.toMap(),
      );
      return _handleResponse<T>(request, response);
    } on DioError catch (error) {
      _handleError(error);
    }
  }

  Future<T> _handleResponse<T>(Request<T> request, Response response) async {
    if (_requestSuccessful(response.statusCode)) {
      return request.createResponse(json.decode(response.data as String));
    }
    throw RequestException.fromStatusCode(
        response.statusCode, response.statusMessage);
  }

  void _handleError(DioError error) {
    if (error.type == DioErrorType.CONNECT_TIMEOUT) {
      throw ConnectionException(error.message);
    } else {
      throw RequestException.fromStatusCode(
          error.response?.statusCode, error.message);
    }
  }

  bool _requestSuccessful(int statusCode) =>
      statusCode >= 200 && statusCode < 300;
}
