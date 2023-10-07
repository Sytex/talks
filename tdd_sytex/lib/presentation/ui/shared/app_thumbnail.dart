import 'package:flutter/material.dart';

class AppThumbnail extends StatelessWidget {
  const AppThumbnail({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox.square(
        dimension: 52,
        child: Image.network(url, fit: BoxFit.cover),
      ),
    );
  }
}
