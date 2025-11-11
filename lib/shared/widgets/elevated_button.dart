import 'package:crypto_trading_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../utils/helpers/app_sizes.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor; // 👈 NEW
  final double? fontSizePercent;
  final FontWeight? fontWeight;
  final double? borderRadiusPercent;
  final double? heightPercent;
  final double? width;
  final double? elevation;
  final bool isLoading;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor, // 👈 NEW
    this.fontSizePercent,
    this.fontWeight,
    this.borderRadiusPercent,
    this.heightPercent,
    this.width,
    this.elevation,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.height(heightPercent ?? 7),
      width: width,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.white,
          foregroundColor: textColor ?? AppColors.white,
          elevation: elevation ?? 2,
          shape: RoundedRectangleBorder(
            borderRadius: AppSizes.borderRadius(borderRadiusPercent ?? 3),
            side: BorderSide(
              color: borderColor ?? Colors.transparent, // 👈 Reusable border color
              width: 1.5,
            ),
          ),
        ),
        child: isLoading
            ? SizedBox(
          height: AppSizes.height(2.5),
          width: AppSizes.height(2.5),
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              textColor ?? AppColors.white,
            ),
          ),
        )
            : Text(
          text,
          style: TextStyle(
            fontSize: AppSizes.font(fontSizePercent ?? 2),
            fontWeight: fontWeight ?? FontWeight.w500,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
