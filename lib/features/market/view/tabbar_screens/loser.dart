import 'package:flutter/material.dart';

import '../../../../shared/widgets/coin_field.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/helpers/app_sizes.dart';

class LoserScreen extends StatefulWidget {
  const LoserScreen({super.key});

  @override
  State<LoserScreen> createState() => _LoserScreenState();
}

class _LoserScreenState extends State<LoserScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: AppSizes.paddingAll(3),
        child: Column(
          children: [
            CoinField(
              coinIcon: AppImages.eth,
              coinName: AppTexts.eth,
              coinSymbol: 'ETH',
              chartImage: AppImages.redChart,
              price: 'Rs2,509.75',
              percentageChange: '-9.77%',
              isPositive: false,
              onTap: () {},
            ),
            SizedBox(height: Sizes.tilesSpace),
            CoinField(
              coinIcon: AppImages.band,
              coinName: AppTexts.band,
              coinSymbol: 'BAND',
              chartImage: AppImages.redChart,
              price: 'Rs73.00',
              percentageChange: '-9.77%',
              isPositive: false,
              onTap: () {},
            ),
            SizedBox(height: Sizes.tilesSpace),
            CoinField(
              coinIcon: AppImages.tron,
              coinName: AppTexts.tron,
              coinSymbol: 'TRX',
              chartImage: AppImages.redChart,
              price: 'Rs2,300',
              percentageChange: '-9.77%',
              isPositive: false,
              onTap: () {},
            ),
            SizedBox(height: Sizes.tilesSpace),
            CoinField(
              coinIcon: AppImages.neo,
              coinName: 'NEO',
              coinSymbol: 'NEO',
              chartImage: AppImages.redChart,
              price: 'Rs100.03',
              percentageChange: '-9.77%',
              isPositive: false,
              onTap: () {},
            ),
            SizedBox(height: Sizes.tilesSpace),
            CoinField(
              coinIcon: AppImages.eos,
              coinName: 'EOS',
              coinSymbol: 'EOS',
              chartImage: AppImages.redChart,
              price: 'Rs2,509.75',
              percentageChange: '-9.77%',
              isPositive: false,
              onTap: () {},
            ),
            SizedBox(height: Sizes.tilesSpace),
            CoinField(
              coinIcon: AppImages.dai,
              coinName: 'DAI',
              coinSymbol: 'DAI',
              chartImage: AppImages.redChart,
              price: 'Rs2,509.75',
              percentageChange: '-9.77%',
              isPositive: false,
              onTap: () {},
            ),

          ],
        ),
      ),
    );
  }
}
