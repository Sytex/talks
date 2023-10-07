import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tdd_sytex/presentation/presentation.dart';
import 'package:tdd_sytex/presentation/ui/marvel_list.dart';

class MarvelApp extends StatefulWidget {
  const MarvelApp({super.key, required this.marvelHeroesCubit});

  final MarvelHeroesCubit marvelHeroesCubit;

  @override
  State<MarvelApp> createState() => _MarvelAppState();
}

class _MarvelAppState extends State<MarvelApp> {
  @override
  void initState() {
    super.initState();
    widget.marvelHeroesCubit.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: BlocBuilder<MarvelHeroesCubit, MarvelHeroesState>(
            bloc: widget.marvelHeroesCubit,
            builder: (context, state) {
              return switch (state) {
                MarvelHeroesLoading() => const Spinner(),
                MarvelHeroesFailure() => const ErrorMessage(),
                MarvelHeroesSuccess(:final heroes) =>
                  MarvelList(heroes: heroes),
                _ => const SizedBox.shrink()
              };
            },
          ),
        ),
      ),
    );
  }
}
