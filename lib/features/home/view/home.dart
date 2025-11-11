import 'package:crypto_trading_app/features/home/view/widgets/coins_list.dart';
import 'package:crypto_trading_app/shared/widgets/section_heading.dart';
import 'package:crypto_trading_app/utils/constants/colors.dart';
import 'package:crypto_trading_app/utils/constants/images.dart';
import 'package:crypto_trading_app/utils/constants/sizes.dart';
import 'package:crypto_trading_app/utils/constants/texts.dart';
import 'package:crypto_trading_app/utils/helpers/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<HomeProvider>(context, listen: false).loadCoins());
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: homeProvider.refreshCoins,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: AppSizes.paddingSymmetric(horizontal: 3),
              child: Column(
                children: [
                  Image(
                    image: AssetImage(AppImages.homeScreenCard),
                    width: AppSizes.width(120),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: Sizes.sectionGap),
                  SectionTitle(
                    title: AppTexts.trendingCoins,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: Sizes.tilesSpace),
                  CoinList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
