import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'app_colors.dart';
import 'app_strings.dart';

class AppTextStyle with Diagnosticable {
  static TextStyle? splashTextOne = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );

  static TextStyle? splashTextTwo = TextStyle(
    fontSize: 80,
    fontWeight: FontWeight.bold,
    color: AppColors.textSecondary2,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );

  static TextStyle? splashButtonText = TextStyle(
    fontSize: 18,
    letterSpacing: 1.1,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );

  static TextStyle? snackbar = TextStyle(
    fontSize: 16,
    color: AppColors.fontPrimary,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );

  static TextStyle? homeText = TextStyle(
    fontSize: 18,
    color: AppColors.white,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );

  static TextStyle? loginDescriptionText = TextStyle(
      fontSize: 16,
      color: AppColors.textSecondary,
      fontFamily: AppStrings.fontFamilyCenturtGothic,
      height: 1.2
  );

  static TextStyle? loginNoteText = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
    fontFamily: AppStrings.fontFamilyCenturtGothicBold,
    height: 1,
  );

  static TextStyle? loginFieldText = TextStyle(
    fontSize: 15,
    color: AppColors.white,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );

  static TextStyle? loginFieldErrorText  = TextStyle(
    fontSize: 13,
    color: AppColors.white,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );

  static TextStyle? loginButton = TextStyle(
    fontSize: 16,
    color: AppColors.fontPrimary,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
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
  static TextStyle? profileTitles = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );
  static TextStyle? profileSubTitles = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );

  static TextStyle? userProfileTitle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );
  static TextStyle? userProfileDetails = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.grey,
    fontFamily: AppStrings.fontFamilyCenturtGothic,
  );
}
