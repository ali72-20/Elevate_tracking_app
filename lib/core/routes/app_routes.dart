import 'package:flutter/material.dart';
import 'package:tracking_app/core/routes/page_route_name.dart';
import 'package:tracking_app/src/presentation/pages/forget_password/forget_password_screen.dart';
import 'package:tracking_app/src/presentation/pages/login/view/login_view.dart';
import 'package:tracking_app/src/presentation/pages/profile/view/profile_view.dart';
import '../../src/presentation/splash_screen.dart';

class AppRoutes{
  AppRoutes._();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.splash:
        return _handelMaterialPageRoute(
            settings: settings, widget: const SplashScreen());
      case PageRoutesName.forgetPassword:
        return _handelMaterialPageRoute(widget: ForgetPasswordScreen(), settings: settings);
      case PageRoutesName.login:
        return _handelMaterialPageRoute(widget: LoginView(), settings: settings);
      case PageRoutesName.profile:
        return _handelMaterialPageRoute(widget: ProfileView(), settings: settings);
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