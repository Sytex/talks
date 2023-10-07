import 'package:flutter/material.dart';

import 'package:tdd_sytex/presentation/ui/shared/app_text_row.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AppTextRow.body('Error!', textAlign: TextAlign.center),
    );
  }
}
