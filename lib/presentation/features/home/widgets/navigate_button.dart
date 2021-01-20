import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:spa_coding_exercise/presentation/widgets/button.dart';
import 'package:spa_coding_exercise/domain/entities/place.dart';
import 'package:spa_coding_exercise/presentation/localization/generated/l10n.dart';

class NavigateButton extends StatelessWidget {
  final Place destination;
  final Place userPlace;

  const NavigateButton({
    Key key,
    @required this.destination,
    @required this.userPlace,
  })  : assert(destination != null),
        assert(userPlace != null),
        super(key: key);

  Future<void> _navigateUserToPlace() async {
    final availableMaps = await MapLauncher.installedMaps;
    if (availableMaps.isNotEmpty) {
      await availableMaps.first.showDirections(
        originTitle: userPlace.name,
        origin: Coords(
          userPlace.location.latitude,
          userPlace.location.longitude,
        ),
        destinationTitle: destination.name,
        destination: Coords(
          destination.location.latitude,
          destination.location.longitude,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Button(
      title: AppLocalizations.of(context).navigate,
      onTapped: _navigateUserToPlace,
    );
  }
}
