import 'package:crypto_trading_app/utils/helpers/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../shared/widgets/coin_field.dart';
import '../../../../utils/constants/images.dart';
import '../../../home/viewmodel/home_provider.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({super.key});

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final provider = Provider.of<HomeProvider>(context, listen: false);
      if (provider.coins.isEmpty && !provider.isLoading) {
        provider.loadCoins(perPage: 50, displayLimit: 50);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);

    if (provider.isLoading) {
      return Center(
        child: Padding(
          padding: AppSizes.paddingAll(4),
          child: SizedBox(
            height: AppSizes.height(3),
            width: AppSizes.height(3),
            child: const CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      );
    }

    if (provider.errorMessage != null) {
      return Center(
        child: Padding(
          padding: AppSizes.paddingAll(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  onPressed: () => provider.loadCoins(perPage: 50),
                  child: Text(
                    'Retry',
                    style: TextStyle(fontSize: AppSizes.responsiveFont(1.8)),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (provider.coins.isEmpty) {
      return Center(
        child: Padding(
          padding: AppSizes.paddingAll(2),
          child: Text(
            'No coins available',
            style: TextStyle(fontSize: AppSizes.responsiveFont(1.8)),
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => provider.refreshCoins(),
      child: ListView.builder(
        padding: AppSizes.paddingAll(3),
        itemCount: provider.coins.length,
        itemBuilder: (context, index) {
          final coin = provider.coins[index];
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
        },
      ),
    );
  }
}