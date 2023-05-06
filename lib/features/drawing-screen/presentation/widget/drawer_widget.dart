import 'dart:typed_data';

import 'package:facetcher/features/drawing-screen/presentation/widget/popup_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:facetcher/core/utils/app_colors.dart';
import 'package:facetcher/core/utils/media_query_values.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/buttons/button_widget.dart';
import '../../../../core/widgets/drawer/scribble_drawer.dart';
import '../../../../core/widgets/drawer/scribble_drawer_notifier.dart';
import '../../domain/entities/drawing_trial_request.dart';
import '../cubit/create_user_trial_cubit.dart';
import '../cubit/create_user_trial_state.dart';
import 'drawer_toolbar.dart';

class DrawerWidget extends StatefulWidget {
  final int submissionId;

  const DrawerWidget({Key? key, required this.submissionId}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late ScribbleDrawerNotifier notifier;

  @override
  void initState() {
    super.initState();
    notifier = ScribbleDrawerNotifier();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 512,
        height: 512,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          border: Border.all(
            width: 1,
            color: AppColors.border,
            style: BorderStyle.solid,
          ),
        ),
        child: Stack(
          children: [
            ScribbleDrawer(
              notifier: notifier,
              drawEraser: true,
              drawPen: true,
            ),
          ],
        ),
      ),
      Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: context.height * 0.02),
            child: DrawerToolbar(notifier: notifier, context: context),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: context.height * 0.03),
        child: BlocConsumer<CreateUserTrialCubit, CreateUserTrialState>(
          builder: ((context, state) {
            if (state is CreateUserTrialLoading) {
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
              return ButtonWidget(
                backgroundColor: AppColors.navigatorItem,
                onPress: () {
                  const PopupLoader().showPopupLoader(context);
                  _renderImage(context).then((image) => {
                    BlocProvider.of<CreateUserTrialCubit>(context).createUserTrial(DrawingTrialRequest(image, widget.submissionId))
                  });
                },
                child: Text("Process", style: AppTextStyle.buttonText,),
              );
            }
          }),
          listener: ((context, state) {
            if (state is CreateUserTrialError) {
              const PopupLoader().closePopupLoader(context);
              Constants.showSnackBar(context: context, message: state.message);
            } else if (state is CreateUserTrialSuccess) {
              const PopupLoader().closePopupLoader(context);
              Navigator.pushNamed(context, Routes.appDrawingResult, arguments: state.userTrial.body,);
            }
          }),
        ),
      ),
    ]);
  }

  Future<Uint8List> _renderImage(BuildContext context) async {
    final renderedImage = await notifier.renderImage();
    return renderedImage.buffer.asUint8List();
  }
}