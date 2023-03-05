import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'app_colors.dart';
import 'app_strings.dart';

class AppTextStyle with Diagnosticable {
  static TextStyle? snackbar = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.fontPrimary,
    fontFamily: AppStrings.fontFamilyComfortaa,
  );

  // static TextStyle? splashText = TextStyle(
  //   fontSize: 32,
  //   fontWeight: FontWeight.w400,
  //   color: AppColors.white,
  //   fontFamily: AppStrings.fontFamilyComfortaa,
  // );

  static TextStyle? homeText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    fontFamily: AppStrings.fontFamilyComfortaa,
  );

  static TextStyle? navigatorItem = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.navigatorFont,
    fontFamily: AppStrings.fontFamilyComfortaa,
  );

  static TextStyle? drawingScreenTitle = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );
  static TextStyle? appBarUserProfile = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );

  static TextStyle? homeScreenDetails = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );

  static TextStyle? homeScreenHistory = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );

  static TextStyle? drawingScreenTitleDetails = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );

  static TextStyle? historyButton = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
      fontFamily: AppStrings.fontFamilyCenturtGothic,
      decoration: TextDecoration.underline);

  static TextStyle? homeScreenTextOne = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w400,
    color: AppColors.navigatorFont,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );

  static TextStyle? homeScreenTextTwo = TextStyle(
    fontSize: 90,
    fontWeight: FontWeight.bold,
    color: AppColors.navigatorItem,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );

  static TextStyle? editButtonText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.navigatorItem,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );

  static TextStyle? primaryButtonText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.navigatorFont,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );

  static TextStyle? textDrawingReport = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.navigatorFont,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );

  static TextStyle? textDescribtion = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );

  static TextStyle? animatedButtonText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.animatedButtonText,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );
}
