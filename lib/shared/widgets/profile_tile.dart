import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helpers/app_sizes.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String? assetImage;
  final IconData? icon;
  final bool showArrow;
  final Color? backgroundColor;
  final Color? textColor;
  final double? imageSize;
  final Color? arrowColor;

  const ProfileTile({
    super.key,
    required this.title,
    required this.onTap,
    this.assetImage,
    this.icon,
    this.showArrow = true,
    this.backgroundColor,
    this.textColor,
    this.imageSize,
    this.arrowColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.width(5),
          vertical: AppSizes.height(1.8),
        ),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.radius(4)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Asset Image (priority over icon)
            if (assetImage != null) ...[
              Image.asset(
                assetImage!,
                fit: BoxFit.contain,
              ),
              SizedBox(width: AppSizes.width(3)),
            ] else if (icon != null) ...[
              Icon(
                icon,
                color: AppColors.primary,
                size: AppSizes.icon(3),
              ),
              SizedBox(width: AppSizes.width(3)),
            ],

            // Title
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: textColor ?? Colors.black,
                  fontSize: AppSizes.font(2),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Arrow
            if (showArrow)
              Icon(
                Icons.arrow_forward_ios,
                color: arrowColor ?? AppColors.primary,
                size: AppSizes.icon(2),
              ),
          ],
        ),
      ),
    );
  }
}