import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spa_coding_exercise/presentation/features/home/widgets/navigate_button.dart';
import 'package:spa_coding_exercise/presentation/widgets/button.dart';

import '../../../widgets/utils/localized_material_app.dart';
import '../home_test_data.dart';

void main() {
  const channel = MethodChannel('map_launcher');
  List<MethodCall> log;
  const mapType = 'google';
  const mapName = 'Google Maps';

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    log = <MethodCall>[];
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      log.add(methodCall);
      if (methodCall.method == 'getInstalledMaps') {
        return [
          {
            "mapName": mapName,
            'mapType': mapType,
          }
        ];
      }
    });
  });

  testWidgets(
    'NearbyPlacesIndicator should display count and description',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const LocalizedMaterialApp(
          child: NavigateButton(
            destination: place2,
            userPlace: place1,
          ),
        ),
      );
      await tester.pump();

      final buttonFinder = find.byType(Button);
      expect(buttonFinder, findsOneWidget);

      final Button button = tester.widget(buttonFinder.first);
      expect(button.onTapped, isNotNull);

      await tester.tap(buttonFinder);
      await tester.pump();

      expect(log.first.method, 'getInstalledMaps');

      expect(log[1].method, 'showDirections');
      expect(log[1].arguments['destinationTitle'], place2.name);
      expect(log[1].arguments['destinationLatitude'],
          place2.location.latitude.toString());
      expect(log[1].arguments['destinationLongitude'],
          place2.location.longitude.toString());
      expect(log[1].arguments['origintitle'], place1.name);
      expect(log[1].arguments['originLatitude'],
          place1.location.latitude.toString());
      expect(log[1].arguments['originLongitude'],
          place1.location.longitude.toString());
    },
  );
}
