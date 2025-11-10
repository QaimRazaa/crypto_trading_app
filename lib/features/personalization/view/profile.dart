import 'package:crypto_trading_app/features/personalization/view/widgets/profile_card.dart';
import 'package:crypto_trading_app/shared/widgets/profile_tile.dart';
import 'package:crypto_trading_app/utils/constants/colors.dart';
import 'package:crypto_trading_app/utils/constants/images.dart';
import 'package:crypto_trading_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../utils/helpers/app_sizes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                ProfileCard(
                  name: 'Agilan Senthil',
                  email: 'agilansenthilkumar@gmail.com',
                  phoneNumber: '+91 9444977118',
                  profileImageUrl: AppImages.profile,
                ),
                SizedBox(height: Sizes.sectionGap),
                ProfileTile(
                  title: 'History',
                  onTap: () {},
                  assetImage: AppImages.history,
                ),
                SizedBox(height: Sizes.tilesSpace),
                ProfileTile(
                  title: 'Bank Details',
                  onTap: () {},
                  assetImage: AppImages.bank,
                ),
                SizedBox(height: Sizes.tilesSpace),
                ProfileTile(
                  title: 'Notifications',
                  onTap: () {},
                  assetImage: AppImages.notification,
                ),
                SizedBox(height: Sizes.tilesSpace),
                ProfileTile(
                  title: 'Security',
                  onTap: () {},
                  assetImage: AppImages.security,
                ),
                SizedBox(height: Sizes.tilesSpace),
                ProfileTile(
                  title: 'Help and Support',
                  onTap: () {},
                  assetImage: AppImages.help,
                ),
                SizedBox(height: Sizes.tilesSpace),
                ProfileTile(
                  title: 'Terms and Conditions',
                  onTap: () {},
                  assetImage: AppImages.termsAndCondition,
                ),
                SizedBox(height: Sizes.tilesSpace),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
