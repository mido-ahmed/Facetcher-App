import 'package:facetcher/features/app-report-problem/presentation/cubit/report_problem_cubit.dart';
import 'package:facetcher/features/drawing-details/presentation/cubit/create_or_update_user_submission_cubit.dart';
import 'package:facetcher/features/drawing-screen/presentation/cubit/create_user_trial_cubit.dart';
import 'package:facetcher/features/user-change-password/presentation/cubit/user_change_password_cubit.dart';
import 'package:facetcher/features/user-history/presentation/cubit/current_user_submissions_cubit.dart';
import 'package:facetcher/features/user-profile/presentation/cubit/remove_user_profile_picture_cubit.dart';
import 'package:facetcher/features/user-profile/presentation/cubit/signout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:facetcher/core/utils/app_colors.dart';
import 'package:facetcher/features/app-get-started/presentation/cubit/app_get_started_cubit.dart';
import 'package:facetcher/features/app-signin/presentation/cubit/signin_cubit.dart';
import 'config/locale/app_localizations_setup.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'features/app-splash/presentation/cubit/localization_cubit.dart';
import 'features/drawing-report/presentation/cubit/submit_user_trial_cubit.dart';
import 'features/user-profile/presentation/cubit/current_user_cubit.dart';
import 'features/user-profile/presentation/cubit/upload_user_profile_picture_cubit.dart';
import 'injection_container.dart' as di;

class FacetcherApp extends StatelessWidget {
  const FacetcherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.sl<SigninCubit>()),
          BlocProvider(create: (context) => di.sl<SignoutCubit>()),
          BlocProvider(create: (context) => di.sl<CurrentUserCubit>()),
          BlocProvider(create: (context) => di.sl<LocalizationCubit>()),
          BlocProvider(create: (context) => di.sl<ReportProblemCubit>()),
          BlocProvider(create: (context) => di.sl<AppGetStartedCubit>()),
          BlocProvider(create: (context) => di.sl<CreateUserTrialCubit>()),
          BlocProvider(create: (context) => di.sl<SubmitUserTrialCubit>()),
          BlocProvider(create: (context) => di.sl<UserChangePasswordCubit>()),
          BlocProvider(create: (context) => di.sl<CurrentUserSubmissionsCubit>()),
          BlocProvider(create: (context) => di.sl<UploadUserProfilePictureCubit>()),
          BlocProvider(create: (context) => di.sl<RemoveUserProfilePictureCubit>()),
          BlocProvider(create: (context) => di.sl<CreateOrUpdateUserSubmissionCubit>()),
        ],
        child: BlocBuilder<LocalizationCubit, LocalizationState>(
          buildWhen: (previousState, currentState) {
            return previousState != currentState;
          },
          builder: (context, state) {
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: AppColors.background),
              child: MaterialApp(
                title: AppStrings.appName,
                locale: state.locale,
                debugShowCheckedModeBanner: false,
                theme: appTheme(),
                onGenerateRoute: AppRoutes.onGenerateRoute,
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
                localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
              ),
            );
          },
        ));
  }
}
