import 'package:flutter_test/flutter_test.dart';
import 'package:spa_coding_exercise/presentation/features/home/widgets/nearby_places_indicator.dart';
import 'package:spa_coding_exercise/presentation/widgets/animated_number_text.dart';

import '../../../widgets/utils/localized_material_app.dart';

void main() {
  const int count = 10;
  const description = 'description';

  testWidgets(
    'NearbyPlacesIndicator should display count and description',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const LocalizedMaterialApp(
          child: NearbyPlacesIndicator(
            count: count,
            description: description,
          ),
        ),
      );
      await tester.pump();

      final animatedTextFinder = find.byType(AnimatedNumberText);
      final descriptionTextFinder = find.text(description);
      expect(animatedTextFinder, findsOneWidget);
      expect(descriptionTextFinder, findsOneWidget);

      final AnimatedNumberText animatedText =
          tester.widget(animatedTextFinder.first);
      expect(animatedText.number, count);
    },
  );
}
