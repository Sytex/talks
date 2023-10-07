import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

enum AppGapSize {
  small,
  medium,
  large,
}

class AppGap extends StatelessWidget {
  const AppGap.small({super.key}) : _size = AppGapSize.small;

  const AppGap.medium({super.key}) : _size = AppGapSize.medium;

  const AppGap.large({super.key}) : _size = AppGapSize.large;

  final AppGapSize _size;

  @override
  Widget build(BuildContext context) {
    final size = switch (_size) {
      AppGapSize.small => 8.0,
      AppGapSize.medium => 16.0,
      AppGapSize.large => 32.0,
    };
    return Gap(size);
  }
}
