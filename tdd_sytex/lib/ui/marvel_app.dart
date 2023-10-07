import 'package:flutter/material.dart';

import 'package:tdd_sytex/ui/widgets/widgets.dart';

class MarvelApp extends StatelessWidget {
  const MarvelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: MarvelItem(
            title: 'Marvel superhero',
            description: 'Lorem ipsum dolor sit amet',
            thumbnailUrl: 'https://picsum.photos/52',
          ),
        ),
      ),
    );
  }
}
