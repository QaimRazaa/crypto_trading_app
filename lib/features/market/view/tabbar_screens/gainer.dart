import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../shared/widgets/coin_field.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/helpers/app_sizes.dart';
import '../../../home/viewmodel/home_provider.dart';

class GainerScreen extends StatefulWidget {
  const GainerScreen({super.key});

  @override
  State<GainerScreen> createState() => _GainerScreenState();
}

class _GainerScreenState extends State<GainerScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final provider = Provider.of<HomeProvider>(context, listen: false);
      if (provider.gainers.isEmpty && !provider.isLoadingGainers) {
        provider.loadGainers(perPage: 50, displayLimit: 25);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);

    if (provider.isLoadingGainers) {
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

    if (provider.errorMessageGainers != null) {
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
                'Failed to load gainers',
                style: TextStyle(
                  fontSize: AppSizes.responsiveFont(2),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppSizes.height(0.5)),
              Text(
                provider.errorMessageGainers!,
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
                  onPressed: () => provider.loadGainers(perPage: 50),
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

    if (provider.gainers.isEmpty) {
      return Center(
        child: Padding(
          padding: AppSizes.paddingAll(2),
          child: Text(
            'No gainers found',
            style: TextStyle(fontSize: AppSizes.responsiveFont(1.8)),
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => provider.refreshGainers(),
      child: ListView.builder(
        padding: AppSizes.paddingAll(3),
        itemCount: provider.gainers.length,
        itemBuilder: (context, index) {
          final coin = provider.gainers[index];
          return Padding(
            padding: EdgeInsets.only(bottom: AppSizes.height(1.2)),
            child: CoinField(
              coinIcon: coin.image,
              coinName: coin.name,
              coinSymbol: coin.symbol.toUpperCase(),
              chartImage: AppImages.chart,
              price: coin.getFormattedPrice(
                provider.isPkrSelected,
                provider.usdToPkrRate,
              ),
              percentageChange: coin.formattedPercentage,
              isPositive: true,
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