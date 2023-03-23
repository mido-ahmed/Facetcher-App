import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_starter/core/utils/assets_manager.dart';
import 'package:flutter_starter/core/widgets/icons/animated_icon_button.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/buttons/button_form_widget.dart';
import '../../../../core/widgets/forms/profile_widget.dart';
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
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
                  Center(
                    child: Stack(
                      children: [
                          const SizedBox(
                                width: 160,
                                height: 160,
                                child: ProfileWidget(
                                  userProfileName: 'UserName',
                                  userEmail: '@username',
                                  userProfileUrl: 'assets/images/1.5x/shape.png',
                                ),
                              ),

                        Positioned(
                          bottom: 20,
                          right: 30,
                          top: 25,
                          child: InkWell(
                            hoverColor: AppColors.background.withOpacity(0),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.white,
                                ),
                                color: AppColors.background.withOpacity(0.4),
                              ),
                              child: Icon(
                                Icons.edit,
                                size: 20,
                                color: AppColors.white,
                              ),
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                backgroundColor: AppColors.background,
                                context: context,
                                builder: (context) => uploadingProfilePicture(),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
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
                              child:
                                  Image.asset('assets/images/1.5x/Vector.png'),
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
                    padding: const EdgeInsets.only(top: 40),
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
  // takenPhoto(ImageSource source) async {
  //   final pickedFile = await _picker.pickImage(source: source);
  //   setState(() {
  //     _imageFile = pickedFile as PickedFile;
  //   });
  // }
  uploadingProfilePicture() {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 25),
            child: Text(
              'Choose Your Profile Picture',
              style: AppTextStyle.userProfileTitle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.button),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                onPressed: () {
                  // takenPhoto(ImageSource.camera);
                },
                icon: Icon(
                  Icons.camera_alt,
                  color: AppColors.white,
                ),
                label: Text(
                  'Camera',
                  style: AppTextStyle.userProfileInfo,
                ),
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.button),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                onPressed: () {
                  // widget.takenPhoto;
                  // takenPhoto(ImageSource.gallery);
                },
                icon: Icon(
                  Icons.image,
                  color: AppColors.white,
                ),
                label: Text(
                  'Gallery',
                  style: AppTextStyle.userProfileInfo,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
