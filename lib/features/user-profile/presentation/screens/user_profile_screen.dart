import 'package:facetcher/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:facetcher/core/widgets/icons/animated_icon_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/string_util.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../cubit/current_user_cubit.dart';
import '../cubit/current_user_state.dart';
import '../cubit/signout_cubit.dart';
import '../cubit/signout_state.dart';
import '../widgets/rich_text_titled_widget.dart';
import '../widgets/uploading_profile_picture.dart';
import '../../../../core/widgets/navigator/navigation_bar_wrapper.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool _toggleNavigationBar = false;

  void _handleToggleNavigationBar() {
    setState(() {
      _toggleNavigationBar = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  _getCurrentUser() => BlocProvider.of<CurrentUserCubit>(context).findCurrentUser();

  @override
  Widget build(BuildContext context) {
    return NavigationBarWrapper(
      toggleNavigationBar: _toggleNavigationBar,
      path: ModalRoute.of(context)?.settings.name,
      child: Material(
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: true,
          body: Column(
            children: [
              AppBarWidget(
                leftChild: IconButton(
                  icon: Icon(Icons.arrow_back, color: AppColors.white),
                  onPressed: () => Navigator.pushReplacementNamed(context, Routes.appHome),
                ),
                rightChild: AnimatedIconButton(
                  icon: AnimatedIcons.menu_close,
                  color: AppColors.fontPrimary,
                  onPressed: () => _handleToggleNavigationBar(),
                  durationMilliseconds: 500,
                  size: 32.0,
                  end: 1.0,
                ),
              ),
              Column(
                children: [
                  BlocConsumer<CurrentUserCubit, CurrentUserState>(
                    builder: ((context, state) {
                       if (state is CurrentUserSuccess) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const UploadingProfilePicture(),
                                  // const UploadingProfilePicture(state.user),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: RichTextTitledWidget(
                                      title: 'Account Role',
                                      details: StringUtil.capitalizeFirstLetter(state.user.roles.elementAt(0).role.name),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20,),
                                    child: RichTextTitledWidget(
                                      title: 'Gender',
                                      details: StringUtil.capitalizeFirstLetter(state.user.gender),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20,),
                                    child: RichTextTitledWidget(
                                      title: 'Marital Status',
                                      details: StringUtil.capitalizeFirstLetter(state.user.maritalStatus),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20,),
                                    child: RichTextTitledWidget(
                                      title: 'Country',
                                      details: StringUtil.capitalizeFirstLetter(state.user.country),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20,),
                                    child: RichTextTitledWidget(
                                      title: 'Birthdate',
                                      details: StringUtil.convertDateTimeToDate(state.user.birthdate),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: RichTextTitledWidget(
                                      title: 'Phone Number',
                                      details: StringUtil.formatMobileNumber(state.user.phoneNumber),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                              child: SizedBox(
                                height: 40,
                                width: 200,
                                child: ElevatedButton(
                                  onPressed: () { Navigator.pushNamed(context, Routes.userChangingPassword); },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(AppColors.animatedButtonText),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                        side: const BorderSide(color: Colors.white, width: 0.5,),
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Change Password", style: AppTextStyle.buttonText,),
                                      const SizedBox(width: 6,),
                                      Icon(Icons.lock_outline, color: AppColors.textPrimary, size: 16,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            BlocConsumer<SignoutCubit, SignoutState>(
                              builder: ((context, state) {
                                if (state is SignoutLoading) {
                                  return SizedBox(
                                    height: 40,
                                    width: 230,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(
                                              AppColors.button),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(25.0),
                                              ))),
                                      child: LoadingAnimationWidget.staggeredDotsWave(color: Colors.white, size: 30),
                                    ),
                                  );
                                } else {
                                  return SizedBox(
                                    height: 40,
                                    width: 230,
                                    child: ElevatedButton(
                                      onPressed: () {BlocProvider.of<SignoutCubit>(context).signout();},
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  AppColors.button),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ))),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(AppLocalizations.of(context)!.translate('logout')!, style: AppTextStyle.buttonText,),
                                          const SizedBox(width: 6,),
                                          Icon(Icons.login_outlined, color: AppColors.textPrimary, size: 16,),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              }),
                              listener: ((context, state) {
                                if (state is SignoutSuccess) {
                                  Constants.showSnackBar(context: context, message: state.signoutResponse.message);
                                  Navigator.pushReplacementNamed(context, Routes.appSignin);
                                }
                                if (state is SignoutError) {
                                  Constants.showSnackBar(context: context, message: state.message);
                                  Navigator.pushReplacementNamed(context, Routes.appSignin);
                                }
                              }),
                            ),
                          ],
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(top: context.height * 0.30),
                          child: Center(
                            child: LoadingAnimationWidget.threeArchedCircle(color: AppColors.textPrimary, size: 60),
                          ),
                        );
                      }
                    }),
                    listener: ((context, state) {
                      if (state is CurrentUserError) {
                        Constants.showSnackBar(context: context, message: AppLocalizations.of(context)!.translate('something_wrong')!);
                        Navigator.pushReplacementNamed(context, Routes.appSignin);
                      }
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
