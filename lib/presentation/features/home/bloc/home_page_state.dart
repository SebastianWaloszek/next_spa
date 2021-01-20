part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  final List<Place> spaPlaces;

  const HomePageState({
    this.spaPlaces = const [],
  });

  @override
  List<Object> get props => [
        spaPlaces,
      ];
}

class LoadingHomePageState extends HomePageState {
  const LoadingHomePageState({
    List<Place> spaPlaces,
  }) : super(spaPlaces: spaPlaces);

  factory LoadingHomePageState.fromState(HomePageState state) {
    return LoadingHomePageState(spaPlaces: state.spaPlaces);
  }
}

class LoadedHomePageState extends HomePageState {
  const LoadedHomePageState({
    @required List<Place> spaPlaces,
  })  : assert(spaPlaces != null),
        super(spaPlaces: spaPlaces);
}

class FailedHomePageState extends HomePageState {
  final Failure failure;

  const FailedHomePageState({
    @required this.failure,
    List<Place> spaPlaces,
  })  : assert(failure != null),
        super(spaPlaces: spaPlaces);

  factory FailedHomePageState.fromState(
    HomePageState state, {
    @required Failure failure,
  }) {
    return FailedHomePageState(
      failure: failure,
      spaPlaces: state.spaPlaces,
    );
  }

  @override
  List<Object> get props => [
        ...super.props,
        failure,
      ];
}
