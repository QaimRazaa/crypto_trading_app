import 'package:crypto_trading_app/features/coin_page/view/widgets/appbar.dart';
import 'package:crypto_trading_app/features/coin_page/view/widgets/chart_timeline.dart';
import 'package:crypto_trading_app/features/coin_page/view/widgets/circular_container.dart';
import 'package:crypto_trading_app/shared/widgets/profile_tile.dart';
import 'package:crypto_trading_app/utils/constants/colors.dart';
import 'package:crypto_trading_app/utils/constants/images.dart';
import 'package:crypto_trading_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crypto_trading_app/utils/helpers/app_sizes.dart';
import 'package:crypto_trading_app/features/home/data/model/coin_model.dart';
import '../../../shared/widgets/elevated_button.dart';
import '../viewmodel/coin_detail_provider.dart';
import '../../../features/home/viewmodel/home_provider.dart'; // Add this import

class CoinDetailScreen extends StatefulWidget {
  final CoinModel coin;

  const CoinDetailScreen({super.key, required this.coin});

  @override
  State<CoinDetailScreen> createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
          () => Provider.of<CoinDetailProvider>(
        context,
        listen: false,
      ).loadCoinDetails(widget.coin.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CoinDetailProvider>(context);
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CoinDetailAppBar(
        coinImage: widget.coin.image,
        coinName: widget.coin.name,
        coinSymbol: widget.coin.symbol.toUpperCase(),
        isFavorite: provider.isFavorite,
        onFavoritePressed: () {
          provider.toggleFavorite(widget.coin);
        },
        onExchangePressed: () {},
      ),
      body: SafeArea(
        child: provider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: AppSizes.paddingSymmetric(
                  horizontal: 5,
                  vertical: 2,
                ),
                child: Row(
                  children: [
                    SizedBox(width: Sizes.sectionGap),
                    Text(
                      widget.coin.getFormattedPrice(
                        homeProvider.isPkrSelected,
                        homeProvider.usdToPkrRate,
                      ),
                      style: TextStyle(
                        fontSize: AppSizes.responsiveFont(2.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: Sizes.tilesSpace),
                    Text(
                      widget.coin.formattedPercentage,
                      style: TextStyle(
                        fontSize: AppSizes.responsiveFont(2),
                        color: widget.coin.isPricePositive
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: Sizes.tilesSpace * 3),
              Image(image: AssetImage(AppImages.bigChart)),
              SizedBox(height: Sizes.tilesSpace),
              const SmallLineChart(),
              SizedBox(height: AppSizes.height(2)),
              Padding(
                padding: AppSizes.paddingSymmetric(
                  horizontal: 5,
                  vertical: 1,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircularContainer(label: '1H', isSelected: true),
                        CircularContainer(
                          label: '24H',
                          isSelected: false,
                        ),
                        CircularContainer(
                          label: '1W',
                          isSelected: false,
                        ),
                        CircularContainer(
                          label: '1M',
                          isSelected: false,
                        ),
                        CircularContainer(
                          label: '6M',
                          isSelected: false,
                        ),
                        CircularContainer(
                          label: '1Y',
                          isSelected: false,
                        ),
                        CircularContainer(
                          label: 'ALL',
                          isSelected: false,
                        ),
                      ],
                    ),
                    SizedBox(height: Sizes.sectionGap,),
                    ProfileTile(title: 'Transactions', onTap: (){}),
                    SizedBox(height: Sizes.sectionGap,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomElevatedButton(
                          text: 'BUY',
                          onPressed: () {},
                          backgroundColor: AppColors.primary,
                          width: AppSizes.width(40),
                        ),
                        SizedBox(width: Sizes.tilesSpace),
                        CustomElevatedButton(
                          text: 'SELL',
                          onPressed: () {},
                          width: AppSizes.width(40),
                          backgroundColor: AppColors.primary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}