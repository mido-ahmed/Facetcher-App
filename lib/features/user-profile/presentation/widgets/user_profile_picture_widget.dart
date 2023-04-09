import 'dart:io';
import 'dart:typed_data';
import 'package:facetcher/core/utils/media_query_values.dart';
import 'package:facetcher/data/models/user/user.dart';
import 'package:facetcher/features/user-profile/presentation/cubit/remove_user_profile_picture_cubit.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/image/network_image_loader.dart';
import '../cubit/remove_user_profile_picture_state.dart';
import '../cubit/upload_user_profile_picture_cubit.dart';
import '../cubit/upload_user_profile_picture_state.dart';

class UserProfilePicture extends StatefulWidget {
  final User user;

  const UserProfilePicture({Key? key, required this.user}) : super(key: key);

  @override
  State<UserProfilePicture> createState() => _UserProfilePictureState();
}

class _UserProfilePictureState extends State<UserProfilePicture> {
  late bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isExpanded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            width: 170,
            height: 165,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: widget.user.profilePictureUrl.isEmpty ? AppColors.button : Colors.transparent,
                  radius: 50.0,
                  child: widget.user.profilePictureUrl.isEmpty
                      ? Image.network(ImageNetwork.userShape2, width: 40,)
                      : NetworkImageLoader(
                          width: 100,
                          height: 100,
                          url: widget.user.profilePictureUrl,
                          loader: LoadingAnimationWidget.threeArchedCircle(color: Colors.white, size: 40,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${widget.user.firstName} ${widget.user.lastName}',
                          style: AppTextStyle.userProfileTitle,
                        ),
                        TextSpan(
                          text: '\n${ widget.user.email}',
                          style: AppTextStyle.userProfileDetails,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 70,
            right: 25,
            child: GestureDetector(
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 0.6, color: AppColors.white,),
                  color: AppColors.background.withOpacity(0.5),
                ),
                child: Icon(Icons.camera_alt_outlined, size: 18, color: AppColors.white,),
              ),
              onTap: () async {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(90.0),
                  ),
                  backgroundColor: AppColors.background,
                  context: context,
                  builder: (context) => _updateProfilePicture(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _updateProfilePicture() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      height: _isExpanded ? context.height * 0.20 : context.height * 0.15,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(60),
          topLeft: Radius.circular(60),
        ),
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(45, 45, 45, 1),
              offset: Offset(0, -4),
              blurRadius: 5,
              blurStyle: BlurStyle.normal,
              spreadRadius: 2
          ),
        ],
        color: AppColors.background,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 20, left: 10, right: 10),
            child: Text('Update Profile Picture', style: AppTextStyle.userProfileTitle,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<UploadUserProfilePictureCubit, UploadUserProfilePictureState>(
                builder: ((context, state) {
                  if (state is UploadUserProfilePictureLoading) {
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.button),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0),),
                        ),
                      ),
                      onPressed: () => {},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 4.0),
                        child: LoadingAnimationWidget.staggeredDotsWave(color: Colors.white, size: 28),
                      ),
                    );
                  } else {
                    return ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.button),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0),),
                        ),
                      ),
                      onPressed: () {
                        _pickPhoto().then((image) => {
                          BlocProvider.of<UploadUserProfilePictureCubit>(context).uploadUserProfilePicture(image!)
                        });
                      },
                      icon: Icon(Icons.image, color: AppColors.white),
                      label: Text('Upload', style: AppTextStyle.userProfileInfo,),
                    );
                  }
                }),
                listener: ((context, state) {
                  if (state is UploadUserProfilePictureSuccess) {
                    Constants.showSnackBar(context: context, message: state.response.message);
                    Navigator.pushReplacementNamed(context, Routes.userProfile);
                  }
                  if (state is UploadUserProfilePictureError) {
                    Constants.showSnackBar(context: context, message: state.message);
                    Navigator.pushReplacementNamed(context, Routes.userProfile);
                  }
                }),
              ),
              if ( widget.user.profilePictureUrl.isNotEmpty)
                Row(
                  children: [
                    const SizedBox(width: 20.0,),
                    BlocConsumer<RemoveUserProfilePictureCubit, RemoveUserProfilePictureState>(
                      builder: ((context, state) {
                        if (state is RemoveUserProfilePictureLoading) {
                          return ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(AppColors.removeButton),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0),),
                              ),
                            ),
                            onPressed: () => {},
                            child: Padding(
                              padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 4.0),
                              child: LoadingAnimationWidget.staggeredDotsWave(color: Colors.white, size: 28),
                            ),
                          );
                        } else {
                          return ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(AppColors.removeButton),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0),),
                              ),
                            ),
                            onPressed: () { BlocProvider.of<RemoveUserProfilePictureCubit>(context).removeUserProfilePicture(); },
                            label: Text('Remove', style: AppTextStyle.userProfileInfo,),
                            icon: Icon(Icons.delete_forever, color: AppColors.white),
                          );
                        }
                      }),
                      listener: ((context, state) {
                        if (state is RemoveUserProfilePictureSuccess) {
                          Constants.showSnackBar(context: context, message: state.response.message);
                          Navigator.pushReplacementNamed(context, Routes.userProfile);
                        }
                        if (state is RemoveUserProfilePictureError) {
                          Constants.showSnackBar(context: context, message: state.message);
                          Navigator.pushReplacementNamed(context, Routes.userProfile);
                        }
                      }),
                    ),
                  ],
                ),
            ],
          )
        ],
      ),
    );
  }

  Future<Uint8List?> _pickPhoto() async {
    final image = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false,);
    File? croppedImage = await _cropImage(imageFile: File(image!.files.first.path.toString()));
    return await croppedImage?.readAsBytes();
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            activeControlsWidgetColor: AppColors.button,
            toolbarTitle: 'Image Cropper',
            toolbarColor: AppColors.background,
            toolbarWidgetColor: AppColors.textPrimary,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false
        ),
        IOSUiSettings(title: 'Image Cropper',),
        WebUiSettings(context: context,),
      ],
    );
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }
}
