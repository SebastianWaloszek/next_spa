import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:spa_coding_exercise/common/error/failure.dart';
import 'package:spa_coding_exercise/common/parameters/get_places_parameters.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';
import 'package:spa_coding_exercise/domain/entities/place_location.dart';
import 'package:spa_coding_exercise/domain/use_cases/get_spa_places.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetSpaPlaces _getSpaPlaces;

  HomePageBloc(
    this._getSpaPlaces,
  )   : assert(_getSpaPlaces != null),
        super(
          const LoadingHomePageState(),
        );

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    if (event is LoadSpaPlacesEvent) {
      yield* _handleLoadSpaPlaces(event);
    }
  }

  Stream<HomePageState> _handleLoadSpaPlaces(LoadSpaPlacesEvent event) async* {
    yield LoadingHomePageState.fromState(state);
    final result = await _getSpaPlaces(
      GetPlacesParameters(nearLocation: event.location),
    );
    yield* result.fold(
      onSuccess: (spaPlaces) async* {
        yield LoadedHomePageState(spaPlaces: spaPlaces);
      },
      onFailure: (failure) async* {
        yield FailedHomePageState.fromState(
          state,
          failure: failure,
        );
      },
    );
  }
}
