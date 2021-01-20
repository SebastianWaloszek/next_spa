part of 'user_location_bloc.dart';

abstract class UserLocationEvent extends Equatable {
  const UserLocationEvent();
}

class LoadUserLocationEvent extends UserLocationEvent {
  @override
  List<Object> get props => [];
}
