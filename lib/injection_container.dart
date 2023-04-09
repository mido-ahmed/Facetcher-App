import 'package:dio/dio.dart';
import 'package:facetcher/data/repositories/user-submission/user_submission_repository.dart';
import 'package:facetcher/features/app-get-started/data/usecases/app_get_started_usecase.dart';
import 'package:facetcher/features/app-get-started/presentation/cubit/app_get_started_cubit.dart';
import 'package:facetcher/features/app-signin/domain/usecases/signin_usecase.dart';
import 'package:facetcher/features/app-signin/presentation/cubit/signin_cubit.dart';
import 'package:facetcher/features/drawing-details/domain/usecases/create_or_update_user_submission_usecase.dart';
import 'package:facetcher/features/drawing-details/presentation/cubit/create_or_update_user_submission_cubit.dart';
import 'package:facetcher/features/user-profile/domain/usecases/current_user_usecase.dart';
import 'package:facetcher/features/user-profile/domain/usecases/remove_user_profile_picture_usecase.dart';
import 'package:facetcher/features/user-profile/presentation/cubit/remove_user_profile_picture_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/api_consumer.dart';
import 'core/api/app_authentication.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'core/network/network_info.dart';
import 'data/datasources/authentication/authentication_local_datasource.dart';
import 'data/datasources/authentication/authentication_remote_datasource.dart';
import 'data/datasources/user-submission/user_submission_local_datasource.dart';
import 'data/datasources/user-submission/user_submission_remote_datasource.dart';
import 'data/datasources/user-trial/user_trial_local_datasource.dart';
import 'data/datasources/user-trial/user_trial_remote_datasource.dart';
import 'data/datasources/user/user_local_datasource.dart';
import 'data/datasources/user/user_remote_datasource.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'data/repositories/authentication/authentication_repository_impl.dart';
import 'data/repositories/user-submission/user_submission_repository_impl.dart';
import 'data/repositories/user-trial/user_trial_repository.dart';
import 'data/repositories/user-trial/user_trial_repository_impl.dart';
import 'data/repositories/user/user_repository.dart';
import 'data/repositories/user/user_repository_impl.dart';
import 'data/datasources/localization/localization_local_data_source.dart';
import 'data/repositories/localization/localization_repository_impl.dart';
import 'data/repositories/localization/localization_repository.dart';
import 'features/app-splash/domain/usecases/change_lang_usecase.dart';
import 'features/app-splash/domain/usecases/get_saved_lang_usecase.dart';
import 'features/app-splash/presentation/cubit/localization_cubit.dart';
import 'features/drawing-report/domain/usecases/submit_user_trial_usecase.dart';
import 'features/drawing-report/presentation/cubit/submit_user_trial_cubit.dart';
import 'features/drawing-screen/domain/usecases/create_user_trial_usecase.dart';
import 'features/drawing-screen/presentation/cubit/create_user_trial_cubit.dart';
import 'features/user-profile/domain/usecases/signout_usecase.dart';
import 'features/user-profile/domain/usecases/upload_user_profile_picture_usecase.dart';
import 'features/user-profile/presentation/cubit/current_user_cubit.dart';
import 'features/user-profile/presentation/cubit/signout_cubit.dart';
import 'features/user-profile/presentation/cubit/upload_user_profile_picture_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // !---- Cubits ----!
  // splash
  sl.registerFactory<LocalizationCubit>(() => LocalizationCubit(getSavedLangUseCase: sl(), changeLangUseCase: sl()));
  // get started
  sl.registerFactory<AppGetStartedCubit>(() => AppGetStartedCubit(appGetStartedUseCase: sl()));
  // auth
  sl.registerFactory<SigninCubit>(() => SigninCubit(signinUseCase: sl()));
  sl.registerFactory<SignoutCubit>(() => SignoutCubit(signoutUseCase: sl()));
  // user
  sl.registerLazySingleton<CurrentUserCubit>(() => CurrentUserCubit(profileUserCase: sl()));
  sl.registerLazySingleton<UploadUserProfilePictureCubit>(() => UploadUserProfilePictureCubit(uploadUserProfilePictureUseCase: sl()));
  sl.registerLazySingleton<RemoveUserProfilePictureCubit>(() => RemoveUserProfilePictureCubit(removeUserProfilePictureUseCase: sl()));
  // user submission
  sl.registerLazySingleton<CreateOrUpdateUserSubmissionCubit>(() => CreateOrUpdateUserSubmissionCubit(userSubmissionUseCase: sl()));
  // user trial
  sl.registerLazySingleton<CreateUserTrialCubit>(() => CreateUserTrialCubit(userTrialUseCase: sl()));
  sl.registerLazySingleton<SubmitUserTrialCubit>(() => SubmitUserTrialCubit(submitUserTrialUseCase: sl()));


  // !---- Use cases ----!
  // splash
  sl.registerLazySingleton<ChangeLangUseCase>(() => ChangeLangUseCase(langRepository: sl()));
  sl.registerLazySingleton<GetSavedLangUseCase>(() => GetSavedLangUseCase(langRepository: sl()));
  // get started
  sl.registerLazySingleton<AppGetStartedUseCase>(() => AppGetStartedUseCase(userRepository: sl()));
  // auth
  sl.registerLazySingleton<SigninUseCase>(() => SigninUseCase(authenticationRepository: sl()));
  sl.registerLazySingleton<SignoutUseCase>(() => SignoutUseCase(authenticationRepository: sl()));
  // user
  sl.registerLazySingleton<CurrentUserUseCase>(() => CurrentUserUseCase(authenticationRepository: sl()));
  sl.registerLazySingleton<UploadUserProfilePictureUseCase>(() => UploadUserProfilePictureUseCase(userRepository: sl()));
  sl.registerLazySingleton<RemoveUserProfilePictureUseCase>(() => RemoveUserProfilePictureUseCase(userRepository: sl()));
  // user submission
  sl.registerLazySingleton<CreateOrUpdateUserSubmissionUseCase>(() => CreateOrUpdateUserSubmissionUseCase(userSubmissionRepository: sl()));
  // user trial
  sl.registerLazySingleton<CreateUserTrialUseCase>(() => CreateUserTrialUseCase(userTrialRepository: sl()));
  sl.registerLazySingleton<SubmitUserTrialUseCase>(() => SubmitUserTrialUseCase(userTrialRepository: sl()));


  // !---- Repository ----!
  // authentication
  sl.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl(networkInfo: sl(), authenticationLocalDataSource: sl(), authenticationRemoteDataSource: sl(),));
  // user
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(networkInfo: sl(), userLocalDataSource: sl(), userRemoteDataSource: sl(),));
  // localization
  sl.registerLazySingleton<LocalizationRepository>(() => LocalizationRepositoryImpl(localizationLocalDataSource: sl()));
  // user submission
  sl.registerLazySingleton<UserSubmissionRepository>(() => UserSubmissionRepositoryImpl(networkInfo: sl(), userSubmissionLocalDataSource: sl(), userSubmissionRemoteDataSource: sl(),));
  // user trial
  sl.registerLazySingleton<UserTrialRepository>(() => UserTrialRepositoryImpl(networkInfo: sl(), userTrialLocalDataSource: sl(), userTrialRemoteDataSource: sl(),));


  // !---- Data Sources ----!
  // authentication
  sl.registerLazySingleton<AuthenticationLocalDataSource>(() => AuthenticationLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(() => AuthenticationRemoteDataSourceImpl(apiConsumer: sl()));
  // user
  sl.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(apiConsumer: sl()));
  // localization
  sl.registerLazySingleton<LocalizationLocalDataSource>(() => LocalizationLocalDataSourceImpl(sharedPreferences: sl()));
  // user submission
  sl.registerLazySingleton<UserSubmissionRemoteDataSource>(() => UserSubmissionRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<UserSubmissionLocalDataSource>(() => UserSubmissionLocalDataSourceImpl(sharedPreferences: sl()));
  // user submission
  sl.registerLazySingleton<UserTrialRemoteDataSource>(() => UserTrialRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<UserTrialLocalDataSource>(() => UserTrialLocalDataSourceImpl(sharedPreferences: sl()));


  // !---- Core ----!
  sl.registerLazySingleton<AppAuthentication>(() => AppAuthenticationImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));


  // !---- External ----!
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppInterceptors(sl()));
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
