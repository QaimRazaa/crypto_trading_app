import 'package:flutter/material.dart';
import 'package:crypto_trading_app/utils/helpers/app_sizes.dart';

class CoinField extends StatelessWidget {
  final String coinIcon; // This will now be either asset path or network URL
  final String coinName;
  final String coinSymbol;
  final String chartImage;
  final String price;
  final String percentageChange;
  final bool isPositive;
  final VoidCallback? onTap;
  final bool isNetworkImage; // New parameter

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
    this.isNetworkImage = false, // Default to asset image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isWideScreen = AppSizes.isWideScreen;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
          minHeight: AppSizes.height(9),
          maxHeight: AppSizes.height(9),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.width(isWideScreen ? 2 : 3),
          vertical: AppSizes.height(1.5),
        ),
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
            // Coin Icon - Handles both asset and network images
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isWideScreen ? 40 : AppSizes.width(10),
                maxHeight: isWideScreen ? 40 : AppSizes.width(10),
              ),
              child: isNetworkImage
                  ? Image.network(
                coinIcon,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.currency_bitcoin,
                    size: isWideScreen ? 30 : AppSizes.width(8),
                    color: Colors.grey,
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              )
                  : Image.asset(
                coinIcon,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: AppSizes.width(isWideScreen ? 1.5 : 3)),

            // Coin Name and Symbol
            Expanded(
              flex: isWideScreen ? 3 : 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    coinName,
                    style: TextStyle(
                      fontSize: AppSizes.responsiveFont(2),
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: AppSizes.height(0.25)),
                  Text(
                    coinSymbol,
                    style: TextStyle(
                      fontSize: AppSizes.responsiveFont(1.6),
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),

            SizedBox(width: AppSizes.width(isWideScreen ? 1 : 2)),

            // Chart
            Expanded(
              flex: isWideScreen ? 3 : 2,
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: isWideScreen ? 35 : AppSizes.height(4),
                    maxWidth: isWideScreen ? 80 : double.infinity,
                  ),
                  child: Image.asset(
                    chartImage,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            SizedBox(width: AppSizes.width(isWideScreen ? 1 : 2)),

            // Price and Percentage
            Expanded(
              flex: isWideScreen ? 3 : 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: AppSizes.responsiveFont(2),
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(height: AppSizes.height(0.25)),
                  Text(
                    percentageChange,
                    style: TextStyle(
                      fontSize: AppSizes.responsiveFont(1.6),
                      fontWeight: FontWeight.w500,
                      color: isPositive ? Colors.green : Colors.red,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}