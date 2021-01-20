import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spa_coding_exercise/common/error/failure.dart';
import 'package:meta/meta.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';
import 'package:spa_coding_exercise/domain/use_cases/get_user_place.dart';

part 'user_location_event.dart';
part 'user_location_state.dart';

class UserLocationBloc extends Bloc<UserLocationEvent, UserLocationState> {
  final GetUserPlace _getUserLocation;

  UserLocationBloc(
    this._getUserLocation,
  )   : assert(_getUserLocation != null),
        super(const LoadingUserLocationState());

  @override
  Stream<UserLocationState> mapEventToState(
    UserLocationEvent event,
  ) async* {
    if (event is LoadUserLocationEvent) {
      yield* _handleLoadUserLocation(event);
    }
  }

  Stream<UserLocationState> _handleLoadUserLocation(
    LoadUserLocationEvent event,
  ) async* {
    yield LoadingUserLocationState.fromState(state);
    final result = await _getUserLocation.call(null);
    yield* result.fold(
      onSuccess: (userPlace) async* {
        yield LoadedUserLocationState(userPlace: userPlace);
      },
      onFailure: (failure) async* {
        yield FailedUserLocationState.fromState(
          state,
          failure: failure,
        );
      },
    );
  }
}
