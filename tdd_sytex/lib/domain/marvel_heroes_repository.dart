import 'package:tdd_sytex/domain/marvel_hero.dart';

abstract class MarvelHeroesRepository {
  Future<List<MarvelHero>> fetch();
}
