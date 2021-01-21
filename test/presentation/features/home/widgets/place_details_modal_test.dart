import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spa_coding_exercise/presentation/features/home/widgets/navigate_button.dart';
import 'package:spa_coding_exercise/presentation/features/home/widgets/place_details_modal.dart';

import '../../../widgets/utils/localized_material_app.dart';
import '../home_test_data.dart';

void main() {
  group('PlaceDetailsModal tests', () {
    testWidgets(
      'PlaceDetailsModal should display place name, location and navigate button',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const LocalizedMaterialApp(
            child: PlaceDetailsModal(
              place: place1,
              userLocation: place2,
            ),
          ),
        );
        await tester.pump();

        final nameTextFinder = find.text(place1.name);
        final locationTextFinder = find.text(place1.address.combined);
        final navigateButtonFinder = find.byType(NavigateButton);

        expect(nameTextFinder, findsOneWidget);
        expect(locationTextFinder, findsOneWidget);
        expect(navigateButtonFinder, findsOneWidget);

        final NavigateButton navigateButton =
            tester.widget(navigateButtonFinder);
        expect(navigateButton.destination, place1);
        expect(navigateButton.userPlace, place2);
      },
    );

    testWidgets(
      'PlaceDetailsModal should not display place name',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const LocalizedMaterialApp(
            child: PlaceDetailsModal(
              place: placeWithNoName,
              userLocation: place2,
            ),
          ),
        );
        await tester.pump();

        final nameTextFinder =
            find.byKey(const Key(PlaceDetailsModalKeys.placeNameText));
        final locationTextFinder = find.text(placeWithNoName.address.combined);
        final navigateButtonFinder = find.byType(NavigateButton);

        expect(nameTextFinder, findsNothing);
        expect(locationTextFinder, findsOneWidget);
        expect(navigateButtonFinder, findsOneWidget);

        final NavigateButton navigateButton =
            tester.widget(navigateButtonFinder);
        expect(navigateButton.destination, placeWithNoName);
        expect(navigateButton.userPlace, place2);
      },
    );

    testWidgets(
      'PlaceDetailsModal should not display location',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const LocalizedMaterialApp(
            child: PlaceDetailsModal(
              place: placeWithNoAddress,
              userLocation: place2,
            ),
          ),
        );
        await tester.pump();

        final nameTextFinder = find.text(placeWithNoAddress.name);
        final locationTextFinder =
            find.byKey(const Key(PlaceDetailsModalKeys.addressRow));
        final navigateButtonFinder = find.byType(NavigateButton);

        expect(nameTextFinder, findsOneWidget);
        expect(locationTextFinder, findsNothing);
        expect(navigateButtonFinder, findsOneWidget);

        final NavigateButton navigateButton =
            tester.widget(navigateButtonFinder);
        expect(navigateButton.destination, placeWithNoAddress);
        expect(navigateButton.userPlace, place2);
      },
    );

    testWidgets(
      'PlaceDetailsModal should not display navigate button',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const LocalizedMaterialApp(
            child: PlaceDetailsModal(
              place: placeWithNoLocation,
              userLocation: place2,
            ),
          ),
        );
        await tester.pump();

        final nameTextFinder = find.text(placeWithNoLocation.name);
        final locationTextFinder =
            find.text(placeWithNoLocation.address.combined);
        final navigateButtonFinder = find.byType(NavigateButton);

        expect(nameTextFinder, findsOneWidget);
        expect(locationTextFinder, findsOneWidget);
        expect(navigateButtonFinder, findsNothing);
      },
    );
  });
}
