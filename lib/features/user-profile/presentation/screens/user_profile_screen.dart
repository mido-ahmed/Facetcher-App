import 'package:flutter/material.dart';
import 'package:facetcher/core/widgets/icons/animated_icon_button.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/buttons/button_form_widget.dart';
import '../../../../core/widgets/forms/uploading_profile_picture.dart';
import '../../../../core/widgets/forms/user_profile_details_widget.dart';
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
                  onPressed: () => Navigator.pop(context),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const UploadingProfilePicture(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: UserProfileDetailsWidget(
                                title: 'Password',
                                details: '**********',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    Routes.appDrawingResult,
                                  );
                                },
                                child:
                                Image.asset('assets/icons/Vector.png'),

                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: UserProfileDetailsWidget(
                            title: 'Phone Number',
                            details: '+20 121 121 121 2',
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: UserProfileDetailsWidget(
                            title: 'Account Role',
                            details: 'User Account',
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 40,
                          ),
                          child: UserProfileDetailsWidget(
                            title: 'Age',
                            details: '50',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: ButtonFormWidget(
                      onPress: () {},
                      child: const Text('Log out'),
                    ),
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
