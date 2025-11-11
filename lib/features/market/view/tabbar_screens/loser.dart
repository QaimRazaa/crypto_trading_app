import 'package:crypto_trading_app/utils/helpers/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../shared/widgets/coin_field.dart';
import '../../../../utils/constants/images.dart';
import '../../../home/viewmodel/home_provider.dart';

class LoserScreen extends StatefulWidget {
  const LoserScreen({super.key});

  @override
  State<LoserScreen> createState() => _LoserScreenState();
}

class _LoserScreenState extends State<LoserScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final provider = Provider.of<HomeProvider>(context, listen: false);
      if (provider.losers.isEmpty && !provider.isLoadingLosers) {
        provider.loadLosers(perPage: 50, displayLimit: 25);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);

    if (provider.isLoadingLosers) {
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

    if (provider.losers.isEmpty) {
      return Center(
        child: Padding(
          padding: AppSizes.paddingAll(2),
          child: Text(
            'No losers available',
            style: TextStyle(fontSize: AppSizes.responsiveFont(1.8)),
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => provider.refreshLosers(),
      child: ListView.builder(
        padding: AppSizes.paddingAll(3),
        itemCount: provider.losers.length,
        itemBuilder: (context, index) {
          final coin = provider.losers[index];
          return Padding(
            padding: EdgeInsets.only(bottom: AppSizes.height(1.2)),
            child: CoinField(
              coinIcon: coin.image,
              coinName: coin.name,
              coinSymbol: coin.symbol.toUpperCase(),
              chartImage: AppImages.redChart,
              price: coin.getFormattedPrice(
                provider.isPkrSelected,
                provider.usdToPkrRate,
              ),
              percentageChange: coin.formattedPercentage,
              isPositive: false,
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