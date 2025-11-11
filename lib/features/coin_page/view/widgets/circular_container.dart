import 'package:flutter/material.dart';
import 'package:crypto_trading_app/utils/helpers/app_sizes.dart';
import 'package:crypto_trading_app/utils/constants/colors.dart';

class CircularContainer extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? textColor;

  const CircularContainer({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
    this.activeColor,
    this.inactiveColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppSizes.height(4.2), // responsive height
        width: AppSizes.width(12), // responsive width
        decoration: BoxDecoration(
          borderRadius: AppSizes.borderRadius(10),
          color: isSelected
              ? (activeColor ?? AppColors.primary.withOpacity(0.5))
              : (inactiveColor ?? AppColors.lightGrey.withOpacity(0.2)),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: AppSizes.responsiveFont(1.6),
              fontWeight: FontWeight.w500,
              color: textColor ??
                  (isSelected ? Colors.white : AppColors.black),
            ),
          ),
        ),
      ),
    );
  }
}
