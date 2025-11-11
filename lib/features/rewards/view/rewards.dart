import 'package:crypto_trading_app/features/rewards/view/widgets/coupen_card.dart';
import 'package:crypto_trading_app/utils/constants/colors.dart';
import 'package:crypto_trading_app/utils/constants/images.dart';
import 'package:crypto_trading_app/utils/constants/sizes.dart';
import 'package:crypto_trading_app/utils/helpers/app_sizes.dart';
import 'package:flutter/material.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppSizes.paddingAll(3),
            child: Column(
              children: [
                InfoCard(
                  title: 'Coupons',
                  items: [
                    InfoItem(
                      label: 'No. of Coupons Won',
                      value: 6,
                      valueColor: AppColors.black,
                    ),
                    InfoItem(
                      label: 'Tokens won from Spin so far',
                      value: 8,
                      valueColor: AppColors.primary,
                    ),
                    InfoItem(
                      label: 'Remaining Coupons to Spin',
                      value: 4,
                      valueColor: AppColors.primary,
                    ),
                  ],
                ),
                SizedBox(height: Sizes.tilesSpace),
                InfoCard(
                  title: 'Referral',
                  items: [
                    InfoItem(
                      label: 'Total No of referral',
                      value: 12,
                      valueColor: AppColors.black,
                    ),
                    InfoItem(
                      label: 'Total No of Qualified referral',
                      value: 05,
                      valueColor: AppColors.primary,
                    ),
                  ],
                ),
                SizedBox(height: Sizes.sectionGap),
                Image(image: AssetImage(AppImages.rewardBannerOne)),
                SizedBox(height: Sizes.tilesSpace),
                Image(image: AssetImage(AppImages.rewardBannerTwo)),
                SizedBox(height: Sizes.tilesSpace),
                Image(image: AssetImage(AppImages.rewardBannerThree)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
