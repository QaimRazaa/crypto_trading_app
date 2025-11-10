import 'package:flutter/material.dart';

import '../../utils/helpers/app_sizes.dart';

class CoinField extends StatelessWidget {
  final String coinIcon;
  final String coinName;
  final String coinSymbol;
  final String chartImage;
  final String price;
  final String percentageChange;
  final bool isPositive;
  final VoidCallback? onTap;

  const CoinField({
    Key? key,
    required this.coinIcon,
    required this.coinName,
    required this.coinSymbol,
    required this.chartImage,
    required this.price,
    required this.percentageChange,
    this.isPositive = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppSizes.paddingAll(3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppSizes.borderRadius(3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Coin Icon
            Image.asset(
              coinIcon,
              width: AppSizes.width(10),
              height: AppSizes.width(10),
            ),
            SizedBox(width: AppSizes.width(3)),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  coinName,
                  style: TextStyle(
                    fontSize: AppSizes.font(2),
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: AppSizes.height(0.25)),
                Text(
                  coinSymbol,
                  style: TextStyle(
                    fontSize: AppSizes.font(1.6),
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const Spacer(),

            // Chart
            Image.asset(
              chartImage,
              width: AppSizes.width(15),
              height: AppSizes.height(3.5),
              fit: BoxFit.contain,
            ),
            SizedBox(width: AppSizes.width(4)),

            // Price and Percentage
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: AppSizes.font(2),
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: AppSizes.height(0.25)),
                Text(
                  percentageChange,
                  style: TextStyle(
                    fontSize: AppSizes.font(1.6),
                    fontWeight: FontWeight.w500,
                    color: isPositive ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}