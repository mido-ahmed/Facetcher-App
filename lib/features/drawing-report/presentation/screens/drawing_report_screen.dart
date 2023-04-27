import 'package:facetcher/features/drawing-report/presentation/cubit/submit_user_trial_cubit.dart';
import 'package:flutter/material.dart';
import 'package:facetcher/features/drawing-report/presentation/widgets/face_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/buttons/button_widget.dart';
import '../../../../core/widgets/icons/animated_icon_button.dart';
import '../../../../core/widgets/image/network_image_loader.dart';
import '../../../../core/widgets/navigator/navigation_bar_wrapper.dart';
import '../../../../data/models/user-trial/user_trial.dart';
import '../cubit/submit_user_trial_state.dart';

class DrawingReportScreen extends StatefulWidget {
  const DrawingReportScreen({Key? key}) : super(key: key);

  @override
  State<DrawingReportScreen> createState() => _DrawingReportScreenState();
}

class _DrawingReportScreenState extends State<DrawingReportScreen> {
  bool _toggleNavigationBar = false;

  void _handleToggleNavigationBar() {
    setState(() {
      _toggleNavigationBar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserTrial userTrial = ModalRoute.of(context)?.settings.arguments as UserTrial;
    return NavigationBarWrapper(
      toggleNavigationBar: _toggleNavigationBar,
      path: ModalRoute.of(context)?.settings.name,
      child: Material(
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
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
                  Text("Drawing Report", style: AppTextStyle.drawingScreenTitle,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child: Column(
                      children: [
                        FaceDetails(userTrial: userTrial),
                        Center(child: Text("Your drawing and output", style: AppTextStyle.textDrawingReport,)),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NetworkImageLoader(
                              width: 150,
                              height: 185,
                              url: userTrial.inputImage.imageUrl,
                              loader: LoadingAnimationWidget.threeArchedCircle(color: Colors.white, size: 40,),
                            ),
                            NetworkImageLoader(
                              width: 150,
                              height: 185,
                              url: userTrial.outputImage.imageUrl,
                              loader: LoadingAnimationWidget.threeArchedCircle(color: Colors.white, size: 40,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 15.0),
                    child: BlocConsumer<SubmitUserTrialCubit, SubmitUserTrialState>(
                      builder: ((context, state) {
                        if (state is SubmitUserTrialLoading) {
                          return AbsorbPointer(
                            absorbing: true,
                            child: ButtonWidget(
                              onPress: () {},
                              backgroundColor: AppColors.navigatorItem,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: LoadingAnimationWidget.staggeredDotsWave(color: Colors.white, size: 30,),
                              ),
                            ),
                          );
                        } else {
                          return
                            ButtonWidget(
                              backgroundColor: AppColors.navigatorItem,
                              onPress: () => {BlocProvider.of<SubmitUserTrialCubit>(context).submitUserTrial(userTrial.id)},
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Submit", style: AppTextStyle.buttonText,),
                                    const SizedBox(width: 4,),
                                    Icon(Icons.send, color: AppColors.textPrimary, size: 16,),
                                  ],
                                ),
                              ),
                            );
                        }
                      }),
                      listener: ((context, state) {
                        if (state is SubmitUserTrialError) {
                          Constants.showSnackBar(context: context, message: state.message);
                        } else if (state is SubmitUserTrialSuccess) {
                          Constants.showSnackBar(context: context, message: state.submittedUserTrial.message);
                          Navigator.pushReplacementNamed(context, Routes.appHome);
                        }
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
