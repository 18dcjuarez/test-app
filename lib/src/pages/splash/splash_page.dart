import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:test_app_jun17/src/data/enums/secure_storage_enums.dart';
import 'package:test_app_jun17/src/data/routes/app_routes.dart';
import 'package:test_app_jun17/src/theme/styles.dart';
import 'package:test_app_jun17/src/utils/secure_storage_util.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _checkSessionStatus(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            CustomColors.colorGrey,
            CustomColors.mainGreen.withOpacity(0.5),
            CustomColors.colorGrey
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeIn(
            duration: const Duration(milliseconds: 3000),
            child: Text(
              'Flutter',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          FadeIn(
            duration: const Duration(milliseconds: 4000),
            delay: const Duration(milliseconds: 1000),
            child: Text(
              'Test',
              style: Theme.of(context).textTheme.headline1,
            ),
          )
        ],
      ),
    );
  }

  Future<void> _checkSessionStatus(BuildContext context) async {
    final token =
        await SecureStorageUtil.instance.getData(SecureStorageKey.token);
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushNamedAndRemoveUntil(
        token == null ? AppRoutes.loginPage : AppRoutes.homePage,
        (route) => false,
      ),
    );
  }
}
