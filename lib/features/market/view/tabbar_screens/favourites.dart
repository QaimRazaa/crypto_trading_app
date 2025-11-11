import 'package:crypto_trading_app/utils/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crypto_trading_app/features/coin_page/viewmodel/coin_detail_provider.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../shared/widgets/coin_field.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/helpers/app_sizes.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  void initState() {
    super.initState();
    // Load favorites when screen opens
    Future.microtask(
          () => Provider.of<CoinDetailProvider>(context, listen: false).loadFavorites(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CoinDetailProvider>(context);

    return provider.isLoading
        ? const Center(child: CircularProgressIndicator())
        : provider.favoriteCoins.isEmpty
        ? _buildEmptyState()
        : _buildFavoritesList(provider);
  }

  Widget _buildEmptyState() {
    return SingleChildScrollView(
      child: Padding(
        padding: AppSizes.paddingAll(3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: Sizes.sectionGap * 2),
            Center(child: Image(image: AssetImage(AppImages.favImage))),
            SizedBox(height: Sizes.tilesSpace),
            Text(AppTexts.favText, style: AppTextStyles.headlineMedium),
            SizedBox(height: Sizes.tilesSpace),
            Text(AppTexts.addFav, style: AppTextStyles.bodyMedium),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoritesList(CoinDetailProvider provider) {
    return ListView.separated(
      padding: AppSizes.paddingAll(3),
      itemCount: provider.favoriteCoins.length,
      separatorBuilder: (context, index) => SizedBox(height: Sizes.tilesSpace),
      itemBuilder: (context, index) {
        final coin = provider.favoriteCoins[index];
        return CoinField(
          coinIcon: coin.image,
          coinName: coin.name,
          coinSymbol: coin.symbol.toUpperCase(),
          chartImage: coin.isPricePositive ? AppImages.chart : AppImages.redChart,
          price: coin.formattedPrice,
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
        );
      },
    );
  }
}