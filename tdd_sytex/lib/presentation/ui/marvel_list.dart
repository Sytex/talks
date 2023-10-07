import 'package:flutter/material.dart';

import 'package:tdd_sytex/domain/domain.dart';
import 'package:tdd_sytex/presentation/ui/widgets/widgets.dart';

class MarvelList extends StatelessWidget {
  const MarvelList({super.key, this.heroes = const []});

  final List<MarvelHero> heroes;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        for (final hero in heroes)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: MarvelItem(
              title: hero.name,
              description: hero.abilities.join(', '),
              thumbnailUrl: hero.photoUrl,
            ),
          ),
      ],
    );
  }
}
