import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

/// A helper class for configuring and controlling system UI modes and styles.
///
/// You can use [SystemUIHelper.setFullScreenMode()] to enable immersive sticky
/// mode across the app, or call it conditionally for specific screens.
class SystemUIHelper {
  /// Enables immersive full-screen mode (hides status + navigation bars)
  static void setFullScreenMode() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
  }

  /// Restores default visible system bars (useful for normal screens)
  static void restoreSystemUI() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }
}
