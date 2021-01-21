import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spa_coding_exercise/presentation/features/home/bloc/home_page_bloc.dart';

import '../../../../data/repository_test_data.dart';
import '../../../../domain/use_case_test_data.dart';

void main() {
  HomePageBloc bloc;
  final useCase = GetSpaPlacesMock();

  setUp(() {
    bloc = HomePageBloc(useCase);
  });

  group('HomePageBloc tests', () {
    blocTest(
      'Should emit correct states when loading spa places succeeds',
      build: () {
        when(useCase.call(any)).thenAnswer(
          (_) async => successfulSpaPlacesResult,
        );
        return bloc;
      },
      act: (bloc) async {
        return bloc.add(const LoadSpaPlacesEvent(location: placeLocation));
      },
      expect: [
        const LoadingHomePageState(),
        LoadedHomePageState(spaPlaces: spaPlaces),
      ],
    );

    blocTest(
      'Should emit correct states when loading spa places fails',
      build: () {
        when(useCase.call(any)).thenAnswer(
          (_) async => failedSpaPlacesResult,
        );
        return bloc;
      },
      act: (bloc) async {
        return bloc.add(const LoadSpaPlacesEvent(location: placeLocation));
      },
      expect: [
        const LoadingHomePageState(),
        FailedHomePageState(failure: failure),
      ],
    );
  });
}
