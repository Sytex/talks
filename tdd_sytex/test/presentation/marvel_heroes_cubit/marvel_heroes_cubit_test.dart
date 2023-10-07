import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_sytex/domain/domain.dart';

import 'package:tdd_sytex/presentation/presentation.dart';

import '../../mocks/mocks.dart';

void main() {
  late MockMarvelHeroesRepository mockMarvelHeroesRepository;
  late MarvelHeroesCubit marvelHeroesCubit;

  setUp(() {
    mockMarvelHeroesRepository = MockMarvelHeroesRepository();
    marvelHeroesCubit = MarvelHeroesCubit(
      mockMarvelHeroesRepository,
    );
  });

  group('fetch() ->', () {
    const heroes = [
      MarvelHero(
        name: 'Wolverine',
        photoUrl:
            'https://i.annihil.us/u/prod/marvel/i/mg/9/00/537bcb1133fd7.jpg',
        abilities: ['Regeneration', 'Adamantium claws'],
        isDeceased: false,
      ),
    ];
    blocTest<MarvelHeroesCubit, MarvelHeroesState>(
      'when successful, emits loading and success states',
      build: () => marvelHeroesCubit,
      act: (cubit) {
        when(() => mockMarvelHeroesRepository.fetch()).thenAnswer((_) async {
          return heroes;
        });

        return cubit.fetch();
      },
      expect: () => const [
        MarvelHeroesLoading(),
        MarvelHeroesSuccess(heroes),
      ],
    );

    blocTest<MarvelHeroesCubit, MarvelHeroesState>(
      'when failed, emits loading and failure states',
      build: () => marvelHeroesCubit,
      act: (cubit) {
        when(() => mockMarvelHeroesRepository.fetch()).thenThrow(Exception());

        return cubit.fetch();
      },
      expect: () => const [
        MarvelHeroesLoading(),
        MarvelHeroesFailure(),
      ],
    );
  });
}
