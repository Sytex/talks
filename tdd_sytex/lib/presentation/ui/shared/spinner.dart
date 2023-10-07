import 'package:flutter/material.dart';

import 'package:tdd_sytex/presentation/ui/shared/app_colors.dart';

class Spinner extends StatelessWidget {
  const Spinner({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(color: AppColors.textDark),
      ),
    );
  }
}
