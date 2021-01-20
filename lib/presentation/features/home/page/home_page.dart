import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_coding_exercise/common/util/injector.dart';
import 'package:spa_coding_exercise/domain/entities/place_location.dart';
import 'package:spa_coding_exercise/presentation/features/home/bloc/home_page_bloc.dart';
import 'package:spa_coding_exercise/presentation/features/home/page/home_page_body.dart';
import 'package:spa_coding_exercise/presentation/features/home/page/home_page_body_parameters.dart';
import 'package:spa_coding_exercise/presentation/features/user_location/bloc/user_location_bloc.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageBloc = Injector.resolve<HomePageBloc>();
  final userLocationBloc = Injector.resolve<UserLocationBloc>();

  @override
  void initState() {
    super.initState();
    _loadUserLocation();
  }

  void _loadUserLocation() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      userLocationBloc.add(LoadUserLocationEvent());
    });
  }

  void _loadSpaPlaces(PlaceLocation location) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      pageBloc.add(LoadSpaPlacesEvent(
        location: location,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserLocationBloc, UserLocationState>(
      cubit: userLocationBloc,
      listener: (context, state) {
        if (state is LoadedUserLocationState) {
          _loadSpaPlaces(state.userPlace.location);
        }
      },
      builder: (BuildContext context, UserLocationState userLocationState) {
        return BlocBuilder<HomePageBloc, HomePageState>(
          cubit: pageBloc,
          builder: (BuildContext context, HomePageState state) {
            return HomePageBody(
              parameters: HomePageBodyParameters(
                context,
                spaPlaces: state.spaPlaces,
                userPlace: userLocationState.userPlace,
                getCurrentLocation: _loadUserLocation,
              ),
            );
          },
        );
      },
    );
  }
}
