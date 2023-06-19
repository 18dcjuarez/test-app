import 'package:flutter/material.dart';
import 'package:test_app_jun17/src/pages/detail/detail_page.dart';
import 'package:test_app_jun17/src/pages/form/form_page.dart';
import 'package:test_app_jun17/src/pages/home/home_page.dart';
import 'package:test_app_jun17/src/pages/login/login_page.dart';
import 'package:test_app_jun17/src/pages/splash/splash_page.dart';

class AppRoutes {
  static const splashPage = 'splash';
  static const loginPage = 'login';
  static const homePage = 'home';
  static const detailPage = 'detail';
  static const formPage = 'form';

  static Map<String, Widget Function(BuildContext)> routes = {
    splashPage: (BuildContext context) => const SplashPage(),
    loginPage: (BuildContext context) => const LoginPage(),
    homePage: (BuildContext context) => const HomePage(),
    detailPage: (BuildContext context) => const DetailPage(),
    formPage: (BuildContext context) => const FormPage(),
  };

  static Widget routeNameToWidget(String routeName) {
    switch (routeName) {
      case splashPage:
        return const SplashPage();
      case loginPage:
        return const LoginPage();
      case homePage:
        return const HomePage();
      case detailPage:
        return const DetailPage();
      case formPage:
        return const DetailPage();
      default:
        return const SplashPage();
    }
  }
}
