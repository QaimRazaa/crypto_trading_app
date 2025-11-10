import 'package:crypto_trading_app/utils/helpers/app_sizes.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/coin_field.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({super.key});

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: AppSizes.paddingAll(3),
        child: Column(
          children: [
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
            SizedBox(height: Sizes.tilesSpace),
            CoinField(
              coinIcon: AppImages.tron,
              coinName: AppTexts.tron,
              coinSymbol: 'TRX',
              chartImage: AppImages.redChart,
              price: 'Rs5.29',
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
              price: 'Rs73.00',
              percentageChange: '+9.77%',
              isPositive: true,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
