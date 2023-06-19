import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app_jun17/src/data/routes/app_routes.dart';
import 'package:test_app_jun17/src/data/services/navigation_service.dart';
import 'package:test_app_jun17/src/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: getCustomThemeData(context),
      initialRoute: AppRoutes.splashPage,
      routes: AppRoutes.routes,
    );
  }
}
