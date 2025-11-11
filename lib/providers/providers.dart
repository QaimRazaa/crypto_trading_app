import 'package:provider/provider.dart';

import 'navigation_providers.dart';
// Import other controllers/providers here as needed

class AppProviders {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider(create: (_) => NavigationController()),
    // Add other providers here
    // ChangeNotifierProvider(create: (_) => AuthController()),
    // ChangeNotifierProvider(create: (_) => ThemeController()),
  ];
}