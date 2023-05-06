import 'package:facetcher/features/app-get-started/presentation/widgets/intro_widget_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/buttons/button_widget.dart';
import '../cubit/app_get_started_cubit.dart';

class IntroPermissionScreen extends StatefulWidget {
  const IntroPermissionScreen({Key? key}) : super(key: key);

  @override
  State<IntroPermissionScreen> createState() => _IntroPermissionScreenState();
}

class _IntroPermissionScreenState extends State<IntroPermissionScreen> {
  bool _storagePermissionGranted = false;
  bool _galleryPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    final storageStatus = await Permission.storage.status;
    final galleryStatus = await Permission.photos.status;

    if (storageStatus.isGranted) {
      setState(() {
        _storagePermissionGranted = true;
      });
    }

    if (galleryStatus.isGranted) {
      setState(() {
        _galleryPermissionGranted = true;
      });
    }
  }

  Future<void> _requestPermissions() async {
    _checkPermissions();
    await Permission.storage.request();
    await Permission.photos.request();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IntroWidgetWrapper(
              isTop: true,
              imageUrl: ImageNetwork.intro4,
              description: "Please, accept all the required permissions and press allow.",
              title: "Permissions",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  backgroundColor: AppColors.navigatorItem,
                  onPress: () => Navigator.pop(context),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back_outlined, color: AppColors.textPrimary, size: 20,),
                        const SizedBox(width: 4,),
                        Text("Back", style: AppTextStyle.buttonText,),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 40.0,),
                ButtonWidget(
                  backgroundColor: AppColors.navigatorItem,
                  onPress: () async {
                    if (!_storagePermissionGranted || !_galleryPermissionGranted) {
                      await _requestPermissions();
                    } else {
                      await _checkPermissions();
                    }
                    BlocProvider.of<AppGetStartedCubit>(context).setAppGetStarted();
                    Navigator.pushReplacementNamed(context, Routes.appSignin);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Get Started", style: AppTextStyle.buttonText,),
                      const SizedBox(width: 4,),
                      Icon(Icons.rocket_launch_outlined, color: AppColors.textPrimary, size: 20,),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
