import 'package:http/http.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:tdd_sytex/domain/domain.dart';
import 'package:tdd_sytex/infrastructure/infrastructure.dart';

import '../mocks/mocks.dart';

void main() {
  late Client mockClient;
  late MarvelHeroesRepositoryImpl marvelHeroesRepositoryImpl;

  setUp(() {
    mockClient = MockHttpClient();
    marvelHeroesRepositoryImpl = MarvelHeroesRepositoryImpl(mockClient);
  });

  group('fetch() ->', () {
    test(
      'on a successful API call, returns a list of MarvelHeroes',
      () async {
        // * Arrange
        const successfulResponseBody =
            '{"results":[{"name":"Iron Man","abilities":["Tecnología avanzada","Inteligencia","Vuelo"],"photo_url":"url","is_deceased":false}]}';
        const expectedHeroes = [
          MarvelHero(
            name: 'Iron Man',
            abilities: ['Tecnología avanzada', 'Inteligencia', 'Vuelo'],
            photoUrl: 'url',
            isDeceased: false,
          ),
        ];

        when(() {
          return mockClient.get(MarvelHeroesRepositoryImpl.endpoint);
        }).thenAnswer((_) async {
          return Response(successfulResponseBody, 200);
        });

        // * Act
        final result = await marvelHeroesRepositoryImpl.fetch();

        // * Assert
        expect(result, expectedHeroes);
      },
    );

    test(
      'on a failed API call, returns a list of MarvelHeroes',
      () async {
        // * Arrange

        when(() {
          return mockClient.get(MarvelHeroesRepositoryImpl.endpoint);
        }).thenAnswer((_) async {
          return Response('Server error', 500);
        });

        // * Assert
        expect(
          () => marvelHeroesRepositoryImpl.fetch(),
          throwsA(isA<Exception>()),
        );
      },
    );
  });
}
