import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:tdd_sytex/infrastructure/infrastructure.dart';
import 'package:tdd_sytex/presentation/presentation.dart';

void main() {
  // > We'll build our dependencies here
  final marvelHeroesCubit = MarvelHeroesCubit(
    MarvelHeroesRepositoryImpl(http.Client()),
  );

  // > We'll run our app, injecting our dependencies here
  runApp(MarvelApp(marvelHeroesCubit: marvelHeroesCubit));
}
