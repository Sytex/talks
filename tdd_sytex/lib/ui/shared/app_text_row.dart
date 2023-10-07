import 'package:flutter/material.dart';

import 'package:tdd_sytex/ui/shared/app_colors.dart';

enum AppTextType {
  title,
  body,
  caption,
}

class AppTextRow extends StatelessWidget {
  const AppTextRow.title(
    this.text, {
    super.key,
    this.textAlign = TextAlign.start,
  }) : _type = AppTextType.title;

  const AppTextRow.body(
    this.text, {
    super.key,
    this.textAlign = TextAlign.start,
  }) : _type = AppTextType.body;

  const AppTextRow.caption(
    this.text, {
    super.key,
    this.textAlign = TextAlign.start,
  }) : _type = AppTextType.caption;

  final String text;

  final TextAlign textAlign;

  final AppTextType _type;

  @override
  Widget build(BuildContext context) {
    final fontSize = switch (_type) {
      AppTextType.title => 24.0,
      AppTextType.body => 16.0,
      AppTextType.caption => 12.0,
    };
    final fontWeight = switch (_type) {
      AppTextType.title => FontWeight.w600,
      AppTextType.body => FontWeight.normal,
      AppTextType.caption => FontWeight.normal,
    };
    final color = switch (_type) {
      AppTextType.title => AppColors.textDark,
      AppTextType.body => AppColors.textMedium,
      AppTextType.caption => AppColors.textLight,
    };
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            textAlign: textAlign,
            style: TextStyle(
              fontSize: fontSize,
              color: color,
              fontWeight: fontWeight,
              fontFamily: 'Nunito',
            ),
          ),
        ),
      ],
    );
  }
}
