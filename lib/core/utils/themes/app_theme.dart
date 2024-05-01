/*
import 'package:flutter/material.dart';
import 'package:notable/view_model/utils/colors/app_colors.dart';

class AppTheme {
  static ThemeData get lightMode => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        fontFamily: "SF-UI-Display",
        textTheme: const TextTheme(
            //title in the onboarding
            headlineLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
              fontSize: 32,
            ),
            //caption on the onboarding
            bodySmall: TextStyle(
              fontWeight: FontWeight.w200,
              color: AppColors.blackColor,
              fontSize: 20,
            ),
            //skip button
            titleMedium: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
              fontSize: 17,
            ),
            //button color
            labelLarge: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.whiteColor,
              fontSize: 17,
            ),
            //body 3ady
            bodyLarge: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
              fontSize: 18,
            )),
        colorScheme: ColorScheme.fromSeed(
          // The overall brightness of the scheme.
          brightness: Brightness.light,
          // The base color for the scheme.
          seedColor: AppColors.primaryColor,
          // The default color that should be used for widgets like AppBar.
          primary: AppColors.primaryColor,
          // The color to use for text and icons on top of the primary color.
          onPrimary: AppColors.whiteColor,
          // An accent color that should stand out.
          secondary: AppColors.secondaryColor,
          // The color to use for text and icons on top of the secondary color.
          onSecondary: AppColors.whiteColor,
          // The color to use for error states in the application.
          error: AppColors.errorColor,
          // The color to use for text and icons on top of the error color.
          onError: AppColors.whiteColor,

          // The color to use for the background of the application.
          background: Colors.white,
          // The color to use for text and icons on top of the background color.
          onBackground: Colors.black,
          // The color to use for surfaces in the application.
          surface: Colors.white,
          // The color to use for text and icons on top of the surface color.
          onSurface: Colors.black,
          // The color to use for tertiary elements in the application.
          tertiary: Colors.deepPurple,
          // The color to use for text and icons on top of the tertiary color.
          onTertiary: Colors.white,
          // The color to use for outlines in the application.
          outline: Colors.black,
          // A variant of the outline color.
          outlineVariant: Colors.black,
          // The color to use for text and icons on top of the surface variant color
          onSurfaceVariant: Colors.black,
          // The color to use for text and icons on top of the inverse surface color
          onInverseSurface: Colors.black,
          // The color to use for shadows in the application.
          shadow: Colors.black,
          // A tint of the surface color.
          surfaceTint: Colors.deepPurple,
          // A variant of the surface color.
          surfaceVariant: Colors.black,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          shape: CircleBorder(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greyColor,
              width: 0.85,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
              width: 1,
            ),
          ),
          labelStyle: const TextStyle(
            color: AppColors.greyColor,
            fontSize: 13,
            fontFamily: "Lato",
          ),
          floatingLabelStyle: const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 13,
            fontFamily: "Lato",
          ),
          prefixIconColor: AppColors.primaryColor,
          suffixIconColor: AppColors.primaryColor,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      );
}
*/
