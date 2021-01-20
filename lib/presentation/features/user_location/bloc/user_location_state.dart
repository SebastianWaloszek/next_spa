part of 'user_location_bloc.dart';

abstract class UserLocationState extends Equatable {
  final Place userPlace;

  const UserLocationState({this.userPlace});

  @override
  List<Object> get props => [userPlace];
}

class LoadingUserLocationState extends UserLocationState {
  const LoadingUserLocationState({
    Place userPlace,
  }) : super(userPlace: userPlace);

  factory LoadingUserLocationState.fromState(UserLocationState state) {
    return LoadingUserLocationState(userPlace: state.userPlace);
  }
}

class LoadedUserLocationState extends UserLocationState {
  const LoadedUserLocationState({
    @required Place userPlace,
  })  : assert(userPlace != null),
        super(userPlace: userPlace);
}

class FailedUserLocationState extends UserLocationState {
  final Failure failure;

  const FailedUserLocationState({
    @required this.failure,
    Place userPlace,
  })  : assert(failure != null),
        super(userPlace: userPlace);

  factory FailedUserLocationState.fromState(
    UserLocationState state, {
    @required Failure failure,
  }) {
    return FailedUserLocationState(
      failure: failure,
      userPlace: state.userPlace,
    );
  }

  @override
  List<Object> get props => [
        ...super.props,
        failure,
      ];
}
