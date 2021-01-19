import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:spa_coding_exercise/common/environment/environment.dart';
import 'package:spa_coding_exercise/common/environment/environment_dev.dart';
import 'package:spa_coding_exercise/common/environment/environment_prod.dart';
import 'package:spa_coding_exercise/data/data_sources/place_data_source.dart';
import 'package:spa_coding_exercise/data/data_sources/remote/remote_place_data_source.dart';
import 'package:spa_coding_exercise/data/data_sources/remote/remote_spa_data_source.dart';
import 'package:spa_coding_exercise/data/data_sources/spa_data_source.dart';
import 'package:spa_coding_exercise/data/network/managed_network_service.dart';
import 'package:spa_coding_exercise/data/network/network_info.dart';
import 'package:spa_coding_exercise/data/network/network_service.dart';
import 'package:spa_coding_exercise/data/network/network_service_impl.dart';
import 'package:spa_coding_exercise/data/network/web_network_info.dart';
import 'package:spa_coding_exercise/data/repositories/place_repository_impl.dart';
import 'package:spa_coding_exercise/data/repositories/spa_repository_impl.dart';
import 'package:spa_coding_exercise/domain/repositories/place_repository.dart';
import 'package:spa_coding_exercise/domain/repositories/spa_repository.dart';
import 'package:spa_coding_exercise/domain/use_cases/get_spa_places.dart';
import 'package:spa_coding_exercise/domain/use_cases/get_user_location.dart';

class Injector {
  static KiwiContainer container;
  static final T Function<T>([String name]) resolve = container.resolve;

  static void setup() {
    container = KiwiContainer();

    _common();

    _switchBasedOnEnvironment(
      devSetup: _commonDevelopment,
      prodSetup: _commonProduction,
    );

    if (kIsWeb) {
      _webCommon();
      _switchBasedOnEnvironment(
        devSetup: _webDevelopment,
        prodSetup: _webProduction,
      );
    } else {
      _mobileCommon();
      _switchBasedOnEnvironment(
        devSetup: _mobileDevelopment,
        prodSetup: _mobileProduction,
      );
    }
  }

  static void _switchBasedOnEnvironment({
    @required void Function() devSetup,
    @required void Function() prodSetup,
  }) {
    switch (Environment.current.runtimeType) {
      case DevelopmentEnvironment:
        devSetup?.call();
        break;
      case ProductionEnvironment:
        prodSetup?.call();
        break;
    }
  }

  static void _common() {
    container.registerSingleton(
      (c) => Dio(BaseOptions(
        baseUrl: Environment.current.baseUrl,
      )),
    );

    container.registerSingleton<NetworkService>(
      (c) => NetworkServiceImpl(dio: c.resolve()),
      name: 'networkServiceImpl',
    );

    container.registerSingleton<NetworkService>(
      (c) => ManagedNetworkService(
        networkInfo: c.resolve(),
        networkService: c.resolve('networkServiceImpl'),
      ),
    );

    container.registerSingleton<PlaceDataSource>(
      (c) => RemotePlaceDataSource(
        c.resolve(),
      ),
    );

    container.registerSingleton<SpaDataSource>(
      (c) => RemoteSpaDataSource(
        c.resolve(),
      ),
    );

    container.registerSingleton<PlaceRepository>(
      (c) => PlaceRepositoryImpl(c.resolve()),
    );

    container.registerSingleton<SpaRepository>(
      (c) => SpaRepositoryImpl(c.resolve()),
    );

    container.registerSingleton<GetSpaPlaces>(
      (c) => GetSpaPlaces(c.resolve()),
    );

    container.registerSingleton<GetUserLocation>(
      (c) => GetUserLocation(c.resolve()),
    );
  }

  static void _commonDevelopment() {}

  static void _commonProduction() {}

  static void _webCommon() {
    container.registerSingleton<NetworkInfo>(
      (c) => WebNetworkInfoImpl(),
    );
  }

  static void _webDevelopment() {}

  static void _webProduction() {}

  static void _mobileCommon() {
    container.registerSingleton<NetworkInfo>(
      (c) => NetworkInfoImpl(c.resolve()),
    );
    container.registerSingleton((c) => DataConnectionChecker());
  }

  static void _mobileDevelopment() {}

  static void _mobileProduction() {}
}
