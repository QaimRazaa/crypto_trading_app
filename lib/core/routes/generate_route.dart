import 'package:crypto_trading_app/features/coin_page/view/coin_page.dart';
import 'package:crypto_trading_app/features/home/view/home.dart';
import 'package:crypto_trading_app/features/personalization/view/profile.dart';
import 'package:crypto_trading_app/features/portfolio/view/portfolio.dart';
import 'package:crypto_trading_app/features/rewards/view/rewards.dart';
import 'package:crypto_trading_app/features/home/data/model/coin_model.dart';
import 'package:flutter/material.dart';

import '../../features/splash/view/splash.dart';
import '../../navigation_bar.dart';
import 'app_routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
  // Splash Screen
    case AppRoutes.splashSplashScreen:
      return _buildAnimatedRoute(const SplashScreen());

  // Navigation Bar (Main Screen)
    case AppRoutes.navigationBar:
      return _buildAnimatedRoute(const CustomNavigationBar());

  // Home Screen (if needed separately)
    case AppRoutes.homeScreen:
      return _buildAnimatedRoute(const HomeScreen());

    case AppRoutes.portfolioScreen:
      return _buildAnimatedRoute(const PortfolioScreen());

    case AppRoutes.profileScreen:
      return _buildAnimatedRoute(const ProfileScreen());

    case AppRoutes.rewardsScreen:
      return _buildAnimatedRoute(const RewardsScreen());

    case AppRoutes.coinDetailScreen:
      final coin = settings.arguments as CoinModel;
      return _buildAnimatedRoute(CoinDetailScreen(coin: coin));

    default:
      return _buildAnimatedRoute(
        const Scaffold(
          body: Center(child: Text("No route found")),
        ),
      );
  }
}

PageRouteBuilder _buildAnimatedRoute(Widget page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 600),
    reverseTransitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, animation, secondaryAnimation) => page,
    transitionsBuilder: (_, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOutCubic;

      var slideTween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );

      var fadeTween = Tween<double>(begin: 0.0, end: 1.0);

      return SlideTransition(
        position: animation.drive(slideTween),
        child: FadeTransition(
          opacity: animation.drive(fadeTween),
          child: child,
        ),
      );
    },
  );
}