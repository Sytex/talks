import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:tdd_sytex/domain/domain.dart';

part 'marvel_heroes_state.dart';

class MarvelHeroesCubit extends Cubit<MarvelHeroesState> {
  MarvelHeroesCubit(
    this._heroesRepository,
  ) : super(const MarvelHeroesInitial());

  final MarvelHeroesRepository _heroesRepository;

  Future<void> fetch() async {
    emit(const MarvelHeroesLoading());
    try {
      final heroes = await _heroesRepository.fetch();
      emit(MarvelHeroesSuccess(heroes));
    } catch (exception) {
      emit(const MarvelHeroesFailure());
    }
  }
}
