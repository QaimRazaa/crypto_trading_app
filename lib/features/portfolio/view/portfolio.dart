import 'package:crypto_trading_app/shared/widgets/section_heading.dart';
import 'package:crypto_trading_app/utils/constants/colors.dart';
import 'package:crypto_trading_app/utils/constants/sizes.dart';
import 'package:crypto_trading_app/utils/helpers/app_sizes.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/coin_field.dart';
import '../../../shared/widgets/elevated_button.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/texts.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
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
                  image: AssetImage(AppImages.portfolioCard),
                  width: AppSizes.width(110),
                ),
                SizedBox(height: Sizes.tilesSpace),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomElevatedButton(
                      text: 'Deposit PKR',
                      onPressed: () {},
                      backgroundColor: AppColors.primary,
                      width: AppSizes.width(40),
                    ),
                    SizedBox(width: Sizes.tilesSpace),
                    CustomElevatedButton(
                      text: 'Withdraw PKR',
                      onPressed: () {},
                      width: AppSizes.width(40),
                      textColor: AppColors.primary,
                      borderColor: AppColors.primary,
                    ),
                  ],
                ),
                SizedBox(height: Sizes.sectionGap),
                SectionTitle(title: 'Your Coins', fontWeight: FontWeight.w700),
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
                  price: 'Rs2,300',
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
                  price: 'Rs100.03',
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
