part of 'marvel_heroes_cubit.dart';

sealed class MarvelHeroesState extends Equatable {
  const MarvelHeroesState();

  @override
  List<Object> get props => [];
}

final class MarvelHeroesInitial extends MarvelHeroesState {
  const MarvelHeroesInitial();
}

final class MarvelHeroesLoading extends MarvelHeroesState {
  const MarvelHeroesLoading();
}

final class MarvelHeroesFailure extends MarvelHeroesState {
  const MarvelHeroesFailure();
}

final class MarvelHeroesSuccess extends MarvelHeroesState {
  const MarvelHeroesSuccess(this.heroes);

  final List<MarvelHero> heroes;
}
