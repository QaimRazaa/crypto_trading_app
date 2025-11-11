import 'package:crypto_trading_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:crypto_trading_app/utils/helpers/app_sizes.dart';

class CoinDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String coinImage;
  final String coinName;
  final String coinSymbol;
  final VoidCallback? onBackPressed;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onExchangePressed;
  final bool isFavorite;

  const CoinDetailAppBar({
    super.key,
    required this.coinImage,
    required this.coinName,
    required this.coinSymbol,
    this.onBackPressed,
    this.onFavoritePressed,
    this.onExchangePressed,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0, // 🚀 Removes default padding between leading & title
      title: Row(
        children: [
          // Back Button
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black87,
              size: AppSizes.icon(2),
            ),
            onPressed: onBackPressed ?? () => Navigator.pop(context),
          ),

          // Coin Image
          ClipOval(
            child: Image.network(
              coinImage,
              width: AppSizes.width(8),
              height: AppSizes.width(8),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: AppSizes.width(8),
                  height: AppSizes.width(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.currency_bitcoin,
                    color: Colors.grey[600],
                    size: AppSizes.icon(2.5),
                  ),
                );
              },
            ),
          ),
          SizedBox(width: AppSizes.width(2)),

          // Coin Name and Symbol (perfectly aligned)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center, // aligns vertically
            children: [
              Text(
                coinName,
                style: TextStyle(
                  fontSize: AppSizes.responsiveFont(2),
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                coinSymbol.toUpperCase(),
                style: TextStyle(
                  fontSize: AppSizes.responsiveFont(1.5),
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            isFavorite ? Icons.star : Icons.star_border,
            color: isFavorite ? Colors.amber : Colors.grey[600],
            size: AppSizes.icon(2.8),
          ),
          onPressed: onFavoritePressed,
        ),
        SizedBox(width: AppSizes.width(1)),

        // Exchange Button
        Container(
          margin: EdgeInsets.only(right: AppSizes.width(2.5)),
          child: ElevatedButton.icon(
            onPressed: onExchangePressed,
            icon: Icon(
              Icons.swap_horiz,
              size: AppSizes.icon(1.5),
            ),
            label: Text(
              'Exchange',
              style: TextStyle(
                fontSize: AppSizes.responsiveFont(1.5),
                fontWeight: FontWeight.w400,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.width(2),
                vertical: AppSizes.height(.5),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: AppSizes.borderRadius(5),
              ),
              elevation: 0,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
