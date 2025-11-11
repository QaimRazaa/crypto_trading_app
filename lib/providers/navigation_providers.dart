import 'package:flutter/material.dart';

import '../features/home/view/home.dart';
import '../features/market/view/market.dart';
import '../features/personalization/view/profile.dart';
import '../features/portfolio/view/portfolio.dart';
import '../features/rewards/view/rewards.dart';

class NavigationController extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  final List<Widget> screens = [
    HomeScreen(),
    PortfolioScreen(),
    RewardsScreen(),
    MarketScreen(),
    ProfileScreen(),
  ];

  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}