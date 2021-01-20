part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();
}

class LoadSpaPlacesEvent extends HomePageEvent {
  final PlaceLocation location;

  const LoadSpaPlacesEvent({
    @required this.location,
  }) : assert(location != null);

  @override
  List<Object> get props => [
        location,
      ];
}
