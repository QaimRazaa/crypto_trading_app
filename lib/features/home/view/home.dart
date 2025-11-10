import 'package:crypto_trading_app/shared/widgets/section_heading.dart';
import 'package:crypto_trading_app/utils/constants/colors.dart';
import 'package:crypto_trading_app/utils/constants/images.dart';
import 'package:crypto_trading_app/utils/constants/sizes.dart';
import 'package:crypto_trading_app/utils/constants/texts.dart';
import 'package:crypto_trading_app/utils/helpers/app_sizes.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/coin_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppSizes.paddingSymmetric(horizontal: 5),
            child: Column(
              children: [
                Image(
                  image: AssetImage(AppImages.homeScreenCard),
                  width: AppSizes.width(110),
                ),
                SizedBox(height: Sizes.sectionGap),
                SectionTitle(
                  title: AppTexts.trendingCoins,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: Sizes.tilesSpace),
                CoinField(
                  coinIcon: AppImages.bitcoin,
                  coinName: AppTexts.bitcoin,
                  coinSymbol: 'BTC',
                  chartImage: AppImages.redChart,
                  price: 'Rs2,509.75',
                  percentageChange: '+9.77%',
                  isPositive: true,
                  onTap: () {},
                ),
                SizedBox(height: Sizes.tilesSpace),
                CoinField(
                  coinIcon: AppImages.eth,
                  coinName: AppTexts.eth,
                  coinSymbol: 'ETH',
                  chartImage: AppImages.chart,
                  price: 'Rs2,509.75',
                  percentageChange: '+9.77%',
                  isPositive: true,
                  onTap: () {},
                ),
                SizedBox(height: Sizes.tilesSpace),
                CoinField(
                  coinIcon: AppImages.band,
                  coinName: AppTexts.band,
                  coinSymbol: 'BAND',
                  chartImage: AppImages.redChart,
                  price: 'Rs2,509.75',
                  percentageChange: '+9.77%',
                  isPositive: true,
                  onTap: () {},
                ),
                SizedBox(height: Sizes.tilesSpace),
                CoinField(
                  coinIcon: AppImages.cardano,
                  coinName: AppTexts.cardano,
                  coinSymbol: 'ADA',
                  chartImage: AppImages.chart,
                  price: 'Rs2,509.75',
                  percentageChange: '+9.77%',
                  isPositive: true,
                  onTap: () {},
                ),
                SizedBox(height: Sizes.tilesSpace),
                CoinField(
                  coinIcon: AppImages.tron,
                  coinName: AppTexts.tron,
                  coinSymbol: 'TRX',
                  chartImage: AppImages.redChart,
                  price: 'Rs2,509.75',
                  percentageChange: '+9.77%',
                  isPositive: true,
                  onTap: () {},
                ),
                SizedBox(height: Sizes.tilesSpace),
                CoinField(
                  coinIcon: AppImages.tether,
                  coinName: AppTexts.tether,
                  coinSymbol: 'USDT',
                  chartImage: AppImages.chart,
                  price: 'Rs2,509.75',
                  percentageChange: '+9.77%',
                  isPositive: true,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
