import 'dart:io';
import 'package:facetcher/core/utils/media_query_values.dart';
import 'package:facetcher/data/models/user/user.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/assets_manager.dart';

class UserProfilePicture extends StatefulWidget {
  final User user;

  const UserProfilePicture({Key? key, required this.user}) : super(key: key);

  @override
  State<UserProfilePicture> createState() => _UserProfilePictureState();
}

class _UserProfilePictureState extends State<UserProfilePicture> {
  late FilePickerResult? result;
  late PlatformFile? pickedFile;
  late bool _isExpanded = false;
  File? imageFile;

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
            height: 155,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.button,
                  radius: 50.0,
                  child: widget.user.profilePictureUrl.isEmpty
                      ? Image.network(ImageNetwork.userShape2, width: 40,)
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(150.0),
                          child: Image.file(
                            File(imageFile!.path),
                            height: 300.0,
                            width: 300.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
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
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 65,
            right: 30,
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
                  builder: (context) => updateProfilePicture(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  updateProfilePicture() {
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
              spreadRadius: 2),
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
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.button),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0),),
                  ),
                ),
                onPressed: () async {
                  takenPhoto();
                },
                icon: Icon(Icons.image, color: AppColors.white),
                label: Text('Upload', style: AppTextStyle.userProfileInfo,),
              ),
              const SizedBox(width: 20.0,),
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.removeButton),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0),),
                  ),
                ),
                onPressed: () {},
                label: Text('Remove', style: AppTextStyle.userProfileInfo,),
                icon: Icon(Icons.delete_forever, color: AppColors.white),
              ),
            ],
          )
        ],
      ),
    );
  }

  takenPhoto() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result == null) return;
    pickedFile = result.files.first;

    File? img = File(pickedFile!.path.toString());
    img = await _cropImage(imageFile: img);
    setState(
          () {
        imageFile = img;
        Navigator.of(context).pop();
      },
    );
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
