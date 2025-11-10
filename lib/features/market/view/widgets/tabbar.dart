import 'package:crypto_trading_app/features/market/view/tabbar_screens/all.dart';
import 'package:crypto_trading_app/features/market/view/tabbar_screens/favourites.dart';
import 'package:crypto_trading_app/features/market/view/tabbar_screens/gainer.dart';
import 'package:crypto_trading_app/features/market/view/tabbar_screens/loser.dart';
import 'package:crypto_trading_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/helpers/app_sizes.dart';
import '../../viewmodel/tabbar.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(
      builder: (context, provider, child) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Color(0xffE5E5E5),
                width: 1,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _TabItem(
                title: 'All',
                isSelected: provider.selectedIndex == 0,
                onTap: () => provider.selectTab(0),
              ),
              _TabItem(
                title: 'Gainer',
                isSelected: provider.selectedIndex == 1,
                onTap: () => provider.selectTab(1),
              ),
              _TabItem(
                title: 'Loser',
                isSelected: provider.selectedIndex == 2,
                onTap: () => provider.selectTab(2),
              ),
              _TabItem(
                title: 'Favourites',
                isSelected: provider.selectedIndex == 3,
                onTap: () => provider.selectTab(3),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.width(4)),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: AppSizes.paddingSymmetric(vertical: 1.5),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? AppColors.primary : Colors.transparent,
                width: AppSizes.width(0.8),
              ),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: AppSizes.font(1.8),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w600,
                color: isSelected ? AppColors.primary: AppColors.darkGrey,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TabBarContent extends StatelessWidget {
  const TabBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(
      builder: (context, provider, child) {
        return IndexedStack(
          index: provider.selectedIndex,
          children: [
            AllScreen(),
            GainerScreen(),
            LoserScreen(),
            FavouritesScreen(),
          ],
        );
      },
    );
  }
}

