import 'package:crypto_trading_app/core/routes/app_routes.dart';
import 'package:crypto_trading_app/core/routes/generate_route.dart';
import 'package:crypto_trading_app/utils/helpers/app_sizes.dart';
import 'package:crypto_trading_app/utils/helpers/ui_helper.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    SystemUIHelper.setFullScreenMode();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: (context, child) {
        AppSizes.init(context);
        return DevicePreview.appBuilder(context, child);
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.splashSplashScreen,
      onGenerateRoute: generateRoute,
    );
  }
}
