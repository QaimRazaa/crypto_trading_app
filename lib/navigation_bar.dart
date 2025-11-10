
import 'package:crypto_trading_app/features/home/view/home.dart';
import 'package:crypto_trading_app/features/market/view/market.dart';
import 'package:crypto_trading_app/features/personalization/view/profile.dart';
import 'package:crypto_trading_app/features/portfolio/view/portfolio.dart';
import 'package:crypto_trading_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';


class NavigationController extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  final List<Widget> screens = [
    HomeScreen(),
    PortfolioScreen(),
    Center(child: Text('Rewards Screen\nComing Soon!', textAlign: TextAlign.center, style: TextStyle(fontSize: 24))),
    MarketScreen(),
    ProfileScreen(),
  ];

  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

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
              NavigationDestination(icon: Icon(Iconsax.chart), label: 'Portfolio'),
              NavigationDestination(icon: Icon(Iconsax.gift), label: 'Rewards'),
              NavigationDestination(icon: Icon(Iconsax.trend_up), label: 'Market'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ],
          );
        },
      ),
      body: Consumer<NavigationController>(
        builder: (context, controller, child) {
          return controller.screens[controller.selectedIndex];
        },
      ),
    );
  }
}