import 'package:flutter_test/flutter_test.dart';

import 'package:tdd_sytex/ui/ui.dart';

void main() {
  group('MarvelApp ->', () {
    testWidgets('Displays a MarvelItem', (tester) async {
      // * 1. Pump the view
      await tester.pumpWidget(const MarvelApp());
      // * 2. Find the item and expect it to be there
      expect(find.byType(MarvelItem), findsOneWidget);
    });
  });
}
