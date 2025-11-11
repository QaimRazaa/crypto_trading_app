import 'package:crypto_trading_app/features/market/view/widgets/market_bottom_sheet.dart';
import 'package:crypto_trading_app/features/market/view/widgets/tabbar.dart';
import 'package:crypto_trading_app/shared/widgets/section_heading.dart';
import 'package:crypto_trading_app/utils/constants/colors.dart';
import 'package:crypto_trading_app/utils/constants/images.dart';
import 'package:crypto_trading_app/utils/constants/sizes.dart';
import 'package:crypto_trading_app/utils/helpers/app_sizes.dart';
import 'package:flutter/material.dart';


class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: AppSizes.paddingAll(5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image: AssetImage(AppImages.market)),
                      Icon(Icons.search, size: AppSizes.icon(4)),
                    ],
                  ),
                  SizedBox(height: Sizes.sectionGap),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SectionTitle(
                        title: 'Coins',
                        fontWeight: FontWeight.w700,
                      ),
                      MarketInr(),
                    ],
                  ),
                ],
              ),
            ),
            CustomTabBar(),
            Expanded(
              child: TabBarContent(),
            ),
          ],
        ),
      ),
    );
  }
}