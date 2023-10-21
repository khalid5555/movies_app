// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:NewsMovie/app/core/shared/utils/app_colors.dart';

import 'constants.dart';

// *  MY THEME.........................
class AppTheme {
  static final dk = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white38,
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.symmetric(
            vertical: defaultPadding * 1.2, horizontal: defaultPadding)),
    scaffoldBackgroundColor: AppColors.kBlColor,
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.kPrColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    // fontFamily: 'Molhim',
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.kBlColor,
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.kPrColor))),
    textTheme: const TextTheme(
      labelLarge: TextStyle(color: AppColors.kPrColor),
    ),
    // bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.kBlue),
  );
  static final themeLight = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.teal, primary: Colors.deepPurple),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white38,
      border: InputBorder.none,
      hintStyle: TextStyle(color: Colors.white),
      contentPadding: EdgeInsets.symmetric(
          vertical: defaultPadding * 1.2, horizontal: defaultPadding),
    ),
    scaffoldBackgroundColor: AppColors.kWhite,
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.kPrColor),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.kPrColor))),
    // fontFamily: 'Molhim',
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme:
        const TextTheme(labelLarge: TextStyle(color: AppColors.kPrColor)),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.teal),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    ),
    // primaryColor: AppColors.kPrColor,
    // bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.kBlue),
  );
}

TextStyle get inPutStyle {
  return const TextStyle(
    fontFamily: 'Molhim',
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
}

TextStyle get subheading {
  return const TextStyle(
    fontFamily: 'Molhim',
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
}

TextStyle get headingStyle {
  return const TextStyle(
    fontSize: 25,
    fontFamily: 'Molhim',
    fontWeight: FontWeight.bold,
  );
}

//!   Variable const
const kProductsCollection = 'Products';
const kUserCollection = 'users';
const kImageTenderCollection = 'tenderImages';
const kImageCarouselCollection = "image_Carousel";
const LinearGradient mainButton = LinearGradient(colors: [
  Color.fromRGBO(236, 60, 3, 1),
  Color.fromRGBO(234, 60, 3, 1),
  Color.fromRGBO(216, 78, 16, 1),
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);
