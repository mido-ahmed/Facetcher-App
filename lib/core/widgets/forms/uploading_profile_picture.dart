import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_starter/core/widgets/forms/profile_widget.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';

class UploadingProfilePicture extends StatefulWidget {
  const UploadingProfilePicture({Key? key}) : super(key: key);

  @override
  State<UploadingProfilePicture> createState() =>
      _UploadingProfilePictureState();
}

class _UploadingProfilePictureState extends State<UploadingProfilePicture> {
  File? imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Center(
        child: Stack(
          children: [
            SizedBox(
              width: 160,
              height: 160,
              child: ProfileWidget(
                userProfileName: 'UserName',
                userEmail: '@username',
                userProfileUrl: imageFile == null
                    ? Image.asset('assets/images/1.5x/shape.png')
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
            ),
            Positioned(
              bottom: 20,
              right: 30,
              top: 25,
              child: InkWell(
                hoverColor: AppColors.background.withOpacity(0.1),
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    backgroundColor: AppColors.background,
                    context: context,
                    builder: (context) => uploadingProfilePicture(takenPhoto),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  takenPhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile == null) return;

    File? img = File(pickedFile.path);
    img = await _cropImage(imageFile: img);
    setState(() {
      imageFile = img;
      Navigator.of(context).pop();
    });
  }

  uploadingProfilePicture(Function(ImageSource source) onTap) {
    return AnimatedContainer(
      height: 150,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      width: MediaQuery
          .of(context)
          .size
          .width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(70),
            topLeft: Radius.circular(70),
          ),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(48, 48, 48, 1),
                offset: Offset(0, -5),
                blurRadius: 8,
                blurStyle: BlurStyle.normal,
                spreadRadius: 2),
          ],
          color: AppColors.background),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20, left: 10,
                right: 10),
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

                  takenPhoto(ImageSource.camera);
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
                  takenPhoto(ImageSource.gallery);
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

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(sourcePath:
    imageFile.path,
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
            toolbarTitle: 'Cropper',
            toolbarColor: AppColors.background,
            toolbarWidgetColor: AppColors.button,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

}
