import 'package:crypto_trading_app/utils/constants/colors.dart';
import 'package:crypto_trading_app/utils/constants/images.dart';
import 'package:crypto_trading_app/utils/constants/texts.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/app_routes.dart';
import '../viewmodel/splash_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenViewModel _viewModel = SplashScreenViewModel();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.navigationBar);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(child: Image(image: AssetImage(AppImages.splash))),
            Spacer(),
            Text(AppTexts.splashText),
          ],
        ),
      ),
    );
  }
}
