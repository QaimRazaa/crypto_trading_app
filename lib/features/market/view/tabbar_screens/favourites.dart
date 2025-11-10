import 'package:flutter/material.dart';

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
              chartImage: AppImages.chart,
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
              price: 'Rs73.00',
              percentageChange: '+9.77%',
              isPositive: true,
              onTap: () {},
            ),
            SizedBox(height: Sizes.tilesSpace),
            CoinField(
              coinIcon: AppImages.dai,
              coinName: 'DAI',
              coinSymbol: 'DAI',
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
