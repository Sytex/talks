import 'package:flutter/material.dart';

import 'package:tdd_sytex/presentation/ui/shared/shared.dart';

class MarvelItem extends StatelessWidget {
  const MarvelItem({
    super.key,
    required this.title,
    this.description,
    this.thumbnailUrl,
  });

  final String title;

  final String? description;

  final String? thumbnailUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (thumbnailUrl != null) AppThumbnail(url: thumbnailUrl!),
        const AppGap.medium(),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextRow.title(title),
              if (description != null) AppTextRow.body(description!),
            ],
          ),
        ),
      ],
    );
  }
}
