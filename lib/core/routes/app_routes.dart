import 'package:flutter/material.dart';
import 'package:tracking_app/core/routes/page_route_name.dart';
import '../../src/presentation/splash_screen.dart';

class AppRoutes{
  AppRoutes._();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.splash:
        return _handelMaterialPageRoute(
            settings: settings, widget: const SplashScreen());
      default:
        return _handelMaterialPageRoute(
            settings: settings, widget: const Scaffold());
    }
  }






  static MaterialPageRoute<dynamic> _handelMaterialPageRoute(
      {required Widget widget, required RouteSettings settings}) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}