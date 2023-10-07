import 'package:flutter/material.dart';

import 'package:tdd_sytex/presentation/ui/shared/shared.dart';

class MarvelApp extends StatelessWidget {
  const MarvelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: AppTextRow.title(
            'Marvel App!',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
