import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/features/app-get-started/presentation/cubit/app_get_started_cubit.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => GetStartedScreenState();
}

class GetStartedScreenState extends State<GetStartedScreen> {
  bool _storagePermissionGranted = false;
  bool _galleryPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  void _checkPermissions() async {
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

  void _requestPermissions() async {
    _checkPermissions();
    await Permission.storage.request();
    await Permission.photos.request();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: Text(
                        "From sketch",
                        style: AppTextStyle.splashTextOne,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100.0, top: 8.0),
                      child: Text(
                        "To Life",
                        style: AppTextStyle.splashTextTwo,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 350,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    child: SizedBox(
                      height: 45,
                      width: 260,
                      child: ElevatedButton(
                        onPressed: () {
                          if (!_storagePermissionGranted || !_galleryPermissionGranted) {
                            _requestPermissions();
                          } else {
                            _checkPermissions();
                            BlocProvider.of<AppGetStartedCubit>(context).setAppGetStarted();
                            Navigator.pushReplacementNamed(context, Routes.appSignin);
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppColors.button),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ))),
                        child: Text("Get Started",
                          style: AppTextStyle.splashButtonText,
                        ),
                      ),
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
