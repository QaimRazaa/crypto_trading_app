// MarketInr.dart - Update this file
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/widgets/custom_name_row.dart';
import '../../../../shared/widgets/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/helpers/app_sizes.dart';
import '../../../home/viewmodel/home_provider.dart';

class MarketInr extends StatelessWidget {
  const MarketInr({super.key});

  void showMarketBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => const MarketBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return GestureDetector(
          onTap: () => showMarketBottomSheet(context),
          child: Container(
            width: AppSizes.height(13.5),
            height: AppSizes.font(2.95),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGrey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: AppSizes.paddingSymmetric(horizontal: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Market - ${provider.selectedMarket.split(' - ')[0]}',
                      style: TextStyle(color: AppColors.grey, fontSize: AppSizes.font(1.5)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Image(
                    image: AssetImage(AppImages.downArrow),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MarketBottomSheet extends StatelessWidget {
  const MarketBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.radius(6)),
          topRight: Radius.circular(AppSizes.radius(6)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(top: AppSizes.height(1.5)),
            width: AppSizes.width(10),
            height: AppSizes.height(0.5),
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(AppSizes.radius(0.5)),
            ),
          ),
          Padding(
            padding: AppSizes.paddingAll(5),
            child: Row(
              children: [
                SectionTitle(
                  title: 'Markets',
                  fontWeight: FontWeight.w700,
                )
              ],
            ),
          ),
          Consumer<HomeProvider>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  CustomNameRow(
                    title: 'Pakistani - PKR',
                    isSelected: provider.selectedMarket == 'Pakistani - PKR',
                    onTap: () async {
                      await provider.selectMarket('Pakistani - PKR');
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                  Divider(height: 1, color: Color(0xffDFE2E4)),
                  CustomNameRow(
                    title: 'TetherUS - USDT',
                    isSelected: provider.selectedMarket == 'TetherUS - USDT',
                    onTap: () async {
                      await provider.selectMarket('TetherUS - USDT');
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              );
            },
          ),
          SizedBox(height: AppSizes.height(2)),
        ],
      ),
    );
  }
}