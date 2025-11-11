import 'package:crypto_trading_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crypto_trading_app/utils/helpers/app_sizes.dart';
import 'package:crypto_trading_app/utils/constants/images.dart';
import 'package:crypto_trading_app/shared/widgets/coin_field.dart';
import '../../viewmodel/home_provider.dart';

class CoinList extends StatefulWidget {
  const CoinList({super.key});

  @override
  State<CoinList> createState() => _CoinListState();
}

class _CoinListState extends State<CoinList> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<HomeProvider>(context, listen: false).loadCoins(displayLimit: 25));
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);

    if (provider.isLoading) {
      return Padding(
        padding: AppSizes.paddingAll(4),
        child: Center(
          child: SizedBox(
            height: AppSizes.height(3),
            width: AppSizes.height(3),
            child: const CircularProgressIndicator(strokeWidth: 2),
          ),
        )
      );
    }

    if (provider.errorMessage != null) {
      return Padding(
        padding: AppSizes.paddingAll(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: AppSizes.icon(6),
            ),
            SizedBox(height: AppSizes.height(1)),
            Text(
              'Failed to load coins',
              style: TextStyle(
                fontSize: AppSizes.responsiveFont(2),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSizes.height(0.5)),
            Text(
              provider.errorMessage!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: AppSizes.responsiveFont(1.6),
              ),
            ),
            SizedBox(height: AppSizes.height(1)),
            SizedBox(
              height: AppSizes.height(5),
              width: AppSizes.width(30),
              child: ElevatedButton(
                onPressed: provider.loadCoins,
                child: Text(
                  'Retry',
                  style: TextStyle(fontSize: AppSizes.responsiveFont(1.8)),
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (provider.coins.isEmpty) {
      return Padding(
        padding: AppSizes.paddingAll(2),
        child: Text(
          'No coins available',
          style: TextStyle(fontSize: AppSizes.responsiveFont(1.8)),
        ),
      );
    }

    return Padding(
      padding: AppSizes.paddingSymmetric(horizontal: .5, vertical: 1),
      child: Column(
        children: provider.coins.map((coin) {
          return Padding(
            padding: EdgeInsets.only(bottom: AppSizes.height(1.2)),
            child: CoinField(
              coinIcon: coin.image,
              coinName: coin.name,
              coinSymbol: coin.symbol.toUpperCase(),
              chartImage: coin.isPricePositive
                  ? AppImages.chart
                  : AppImages.redChart,
              price: coin.getFormattedPrice(
                provider.isPkrSelected,
                provider.usdToPkrRate,
              ),
              percentageChange: coin.formattedPercentage,
              isPositive: coin.isPricePositive,
              isNetworkImage: true,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.coinDetailScreen,
                  arguments: coin,
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
