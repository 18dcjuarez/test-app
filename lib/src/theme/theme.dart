import 'package:flutter/material.dart';
import 'package:test_app_jun17/src/theme/styles.dart';

ThemeData getCustomThemeData(BuildContext context) {
  return ThemeData(
    appBarTheme: const AppBarTheme(centerTitle: true),
    primaryColor: CustomColors.mainBlue,
    textTheme: Theme.of(context).textTheme.copyWith(
          headline1: const TextStyle(
            color: CustomColors.colorWhite,
            fontSize: 55,
            fontWeight: FontWeight.w900,
            height: 1.5,
          ),
          headline2: const TextStyle(
            color: CustomColors.colorWhite,
            fontSize: 25,
            fontWeight: FontWeight.w300,
            height: 1,
          ),
          headline3: const TextStyle(
            color: CustomColors.colorWhite,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
          headline4: const TextStyle(
            color: CustomColors.colorWhite,
            fontSize: 10,
          ),
          subtitle1: const TextStyle(
            color: CustomColors.colorWhite,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          bodyText1: const TextStyle(
            color: CustomColors.colorWhite,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.3,
          ),
          bodyText2: const TextStyle(
            color: CustomColors.colorWhite,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.3,
          ),
          button: const TextStyle(
            color: CustomColors.mainOrange,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
  );
}
