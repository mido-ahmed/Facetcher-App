import 'package:facetcher/data/models/user-submission/user_submission.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/string_util.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/icons/animated_icon_button.dart';
import '../../../../core/widgets/image/network_image_loader.dart';
import '../../../../core/widgets/navigator/navigation_bar_wrapper.dart';

class UserHistoryDetailsScreen extends StatefulWidget {
  const UserHistoryDetailsScreen({Key? key}) : super(key: key);

  @override
  State<UserHistoryDetailsScreen> createState() => _UserHistoryDetailsState();
}

class _UserHistoryDetailsState extends State<UserHistoryDetailsScreen> {
  bool _toggleNavigationBar = false;

  void _handleToggleNavigationBar() {
    setState(() {
      _toggleNavigationBar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserSubmission userSubmission = ModalRoute.of(context)?.settings.arguments as UserSubmission;
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
                  Text("Submission Report", style: AppTextStyle.drawingScreenTitle,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Title: ", style: AppTextStyle.textReportFieldTitle,),
                                  Text(userSubmission.title, style: AppTextStyle.textReportField,),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Row(
                                  children: [
                                    Text("Gender: ", style: AppTextStyle.textReportFieldTitle,),
                                    Text(StringUtil.capitalizeFirstLetter(userSubmission.gender), style: AppTextStyle.textReportField,),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Row(
                                  children: [
                                    Text("Trials Count: ", style: AppTextStyle.textReportFieldTitle,),
                                    Text("${userSubmission.trialCount}", style: AppTextStyle.textReportField,),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                child: Row(
                                  children: [
                                    Text("Submission Date: ", style: AppTextStyle.textReportFieldTitle,),
                                    Text(StringUtil.convertDateTimeToDate(userSubmission.submissionDate), style: AppTextStyle.textReportField,),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(text: "Description: ", style: AppTextStyle.textReportFieldTitle),
                                    TextSpan(text: userSubmission.description, style: AppTextStyle.textReportField,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(child: Text("Your drawing and output", style: AppTextStyle.textDrawingReport,)),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NetworkImageLoader(
                              width: 150,
                              height: 185,
                              url: userSubmission.inputImage.imageUrl,
                              loader: LoadingAnimationWidget.threeArchedCircle(color: Colors.white, size: 40,),
                            ),
                            NetworkImageLoader(
                              width: 150,
                              height: 185,
                              url: userSubmission.outputImage.imageUrl,
                              loader: LoadingAnimationWidget.threeArchedCircle(color: Colors.white, size: 40,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 25.0, bottom: 15.0),
                  //   child: BlocConsumer<SubmitUserTrialCubit, SubmitUserTrialState>(
                  //     builder: ((context, state) {
                  //       if (state is SubmitUserTrialLoading) {
                  //         return AbsorbPointer(
                  //           absorbing: true,
                  //           child: ButtonWidget(
                  //             onPress: () {},
                  //             backgroundColor: AppColors.navigatorItem,
                  //             child: Padding(
                  //               padding: const EdgeInsets.only(top: 5),
                  //               child: LoadingAnimationWidget.staggeredDotsWave(color: Colors.white, size: 30,),
                  //             ),
                  //           ),
                  //         );
                  //       } else {
                  //         return
                  //           ButtonWidget(
                  //             backgroundColor: AppColors.navigatorItem,
                  //             onPress: () => {BlocProvider.of<SubmitUserTrialCubit>(context).submitUserTrial(userSubmission.id)},
                  //             child: Padding(
                  //               padding: const EdgeInsets.only(left: 10.0),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   Text("Submit", style: AppTextStyle.buttonText,),
                  //                   const SizedBox(width: 4,),
                  //                   Icon(Icons.send, color: AppColors.textPrimary, size: 16,),
                  //                 ],
                  //               ),
                  //             ),
                  //           );
                  //       }
                  //     }),
                  //     listener: ((context, state) {
                  //       if (state is SubmitUserTrialError) {
                  //         Constants.showSnackBar(context: context, message: state.message);
                  //       } else if (state is SubmitUserTrialSuccess) {
                  //         Constants.showSnackBar(context: context, message: state.submittedUserTrial.message);
                  //         Navigator.pushReplacementNamed(context, Routes.appHome);
                  //       }
                  //     }),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
