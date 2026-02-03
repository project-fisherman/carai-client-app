import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body;
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? drawer;

  const AppScaffold({
    super.key,
    this.body,
    this.backgroundColor,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.drawer,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor =
        backgroundColor ?? Theme.of(context).scaffoldBackgroundColor;

    // Determine the brightness of the status bar text/icons based on background luminance.
    // If background is dark (low luminance), we want light icons (Brightness.light).
    // If background is light (high luminance), we want dark icons (Brightness.dark).
    final brightness = ThemeData.estimateBrightnessForColor(
      effectiveBackgroundColor,
    );
    final statusBarIconBrightness = brightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Let background show through
        statusBarIconBrightness: statusBarIconBrightness, // Android
        statusBarBrightness:
            brightness, // iOS: Inverse of Android (Light bg -> Light content? No, iOS is brightness of BAR)
        // actually iOS statusBarBrightness:
        // Brightness.dark means the status bar is over a dark background, so white text.
        // Brightness.light means the status bar is over a light background, so black text.
      ),
      child: Scaffold(
        backgroundColor: effectiveBackgroundColor,
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        drawer: drawer,
      ),
    );
  }
}
