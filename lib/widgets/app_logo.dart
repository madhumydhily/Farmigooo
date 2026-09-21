import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_strings.dart';

/// Reusable FARMIGO Logo Widget with icon badge and title.
class AppLogo extends StatelessWidget {
  final double iconSize;
  final double fontSize;
  final bool showTagline;

  const AppLogo({
    super.key,
    this.iconSize = 48,
    this.fontSize = 28,
    this.showTagline = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: iconSize * 1.5,
          height: iconSize * 1.5,
          decoration: BoxDecoration(
            color: AppColors.primaryGreen.withValues(alpha: 0.12),
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primaryGreen.withValues(alpha: 0.3),
              width: 2,
            ),
          ),
          child: Icon(
            Icons.agriculture_rounded,
            size: iconSize,
            color: AppColors.primaryGreen,
          ),
        ),
        const SizedBox(height: AppColors.paddingSmall),
        Text(
          AppStrings.appName,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.5,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        if (showTagline) ...[
          const SizedBox(height: 4),
          Text(
            AppStrings.appTagline,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ],
    );
  }
}
