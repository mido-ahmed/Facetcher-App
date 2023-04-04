import 'package:flutter/material.dart';
import 'package:facetcher/core/widgets/icons/animated_icon_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../cubit/current_user_cubit.dart';
import '../cubit/current_user_state.dart';
import '../widgets/uploading_profile_picture.dart';
import '../../../../core/widgets/navigator/navigation_bar_wrapper.dart';
import '../widgets/user_profile_details_widget.dart';

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
              BlocConsumer<CurrentUserCubit, CurrentUserState>(
                builder: ((context, state) {
                   if (state is CurrentUserSuccess) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const UploadingProfilePicture(),
                              // const UploadingProfilePicture(state.user),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25),
                                    child: UserProfileDetailsWidget(
                                      title: 'Password',
                                      details: '  **********',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, Routes.userChangingPassword,);
                                      },
                                      child:
                                      Image.network(ImageNetwork.editIcon),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: UserProfileDetailsWidget(
                                  title: 'Phone Number',
                                  details: '  +20 ${state.user.phoneNumber.substring(1)}',
                                ),
                              ),
                              Column(
                                children: state.user.roles.map((userRole) => Padding(
                                  padding: const EdgeInsets.only(top: 25),
                                  child: UserProfileDetailsWidget(
                                    title: 'Account Role',
                                    details: '  ${userRole.role.name}',
                                  ),
                                )).toList(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25,),
                                child: UserProfileDetailsWidget(
                                  title: 'Age',
                                  details: '  ${state.user.age}',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container();
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
        ),
      ),
    );
  }
}
