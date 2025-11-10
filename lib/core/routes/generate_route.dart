import 'package:crypto_trading_app/features/home/view/home.dart';
import 'package:flutter/material.dart';

import '../../features/splash/view/splash.dart';
import 'app_routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // SPlash Screen
    case AppRoutes.splashSplashScreen:
      return _buildAnimatedRoute(const SplashScreen());

    //   Home Screen
    case AppRoutes.homeScreen:
      return _buildAnimatedRoute(const HomeScreen());

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