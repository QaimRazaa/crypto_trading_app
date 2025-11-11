import 'package:crypto_trading_app/providers/navigation_providers.dart';
import 'package:crypto_trading_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Consumer<NavigationController>(
        builder: (context, controller, child) {
          return NavigationBar(
            height: 60,
            elevation: 0,
            selectedIndex: controller.selectedIndex,
            onDestinationSelected: (index) => controller.updateIndex(index),
            backgroundColor: AppColors.white,
            indicatorColor: AppColors.primary.withOpacity(0.5),
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(
                icon: Icon(Iconsax.chart),
                label: 'Portfolio',
              ),
              NavigationDestination(icon: Icon(Iconsax.gift), label: 'Rewards'),
              NavigationDestination(
                icon: Icon(Iconsax.trend_up),
                label: 'Market',
              ),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ],
          );
        },
      ),
      body: Consumer<NavigationController>(
        builder: (context, controller, child) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: Tween<double>(begin: 0.95, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOutCubic,
                    ),
                  ),
                  child: child,
                ),
              );
            },
            child: Container(
              key: ValueKey<int>(controller.selectedIndex),
              child: controller.screens[controller.selectedIndex],
            ),
          );
        },
      ),
    );
  }
}
