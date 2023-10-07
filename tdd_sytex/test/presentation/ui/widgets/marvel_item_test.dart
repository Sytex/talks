import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:tdd_sytex/presentation/ui/ui.dart';

void main() {
  group('MarvelItem ->', () {
    const title = 'Title';
    const description = 'Description';
    const thumbnailUrl = 'Placeholder image url';

    testWidgets(
      'When no description is present, shows a title',
      (tester) async {
        // * 1. Pump the view
        await tester.pumpWidget(
          const MaterialApp(
            home: Material(
              child: MarvelItem(title: title),
            ),
          ),
        );

        // * 2. Find the title and expect it to be there
        expect(find.text(title), findsOneWidget);

        // * 3. Find the description and expect it not to be there
        expect(find.text(description), findsNothing);
      },
    );

    testWidgets(
      'When a description is present, shows both title and description',
      (tester) async {
        // * 1. Pump the view
        await tester.pumpWidget(
          const MaterialApp(
            home: Material(
              child: MarvelItem(title: title, description: description),
            ),
          ),
        );

        // * 2. Find the title and expect it to be there
        expect(find.text(title), findsOneWidget);

        // * 3. Find the description and expect it to be there
        expect(find.text(description), findsOneWidget);
      },
    );

    testWidgets(
      'When a thumbnail is present, shows the thumbnail, title and description',
      (tester) async {
        // * 1. Pump the view

        await mockNetworkImagesFor(() async {
          await tester.pumpWidget(
            const MaterialApp(
              home: Material(
                child: MarvelItem(
                  title: title,
                  description: description,
                  thumbnailUrl: thumbnailUrl,
                ),
              ),
            ),
          );

          // * 2. Find the title and expect it to be there
          expect(find.text(title), findsOneWidget);

          // * 3. Find the description and expect it to be there
          expect(find.text(description), findsOneWidget);

          // * 4. Find the thumbnail and expect it to be there
          expect(
            find.byWidgetPredicate(
              (widget) => widget is AppThumbnail && widget.url == thumbnailUrl,
            ),
            findsOneWidget,
          );
        });
      },
    );
  });
}
