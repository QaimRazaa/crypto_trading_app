import 'package:crypto_trading_app/features/coin_page/viewmodel/coin_detail_provider.dart';
import 'package:crypto_trading_app/features/home/viewmodel/home_provider.dart';
import 'package:crypto_trading_app/features/market/viewmodel/market_selection.dart';
import 'package:crypto_trading_app/features/market/viewmodel/tabbar.dart';
import 'package:crypto_trading_app/providers/navigation_providers.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationController()),
        ChangeNotifierProvider(create: (_) => MarketProvider()),
        ChangeNotifierProvider(create: (_) => TabProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => CoinDetailProvider()),
      ],
      child: DevicePreview(
        enabled: true,
        builder: (context) => const MyApp(),
      ),
    ),
  );
}