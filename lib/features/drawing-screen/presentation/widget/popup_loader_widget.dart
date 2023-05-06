import 'package:facetcher/core/utils/app_text_style.dart';
import 'package:facetcher/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';

class PopupLoader extends StatefulWidget {
  const PopupLoader({Key? key}) : super(key: key);

  @override
  State<PopupLoader> createState() => PopupLoaderState();

  void showPopupLoader(BuildContext context) {
    showDialog(context: context, barrierDismissible: false, builder: (_) => const PopupLoader(),);
  }

  void closePopupLoader(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class PopupLoaderState extends State<PopupLoader> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.only(bottom: 40),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: const BorderRadius.all(
            Radius.circular(30.0),
          ),
          border: Border.all(
            width: 1,
            color: AppColors.border,
            style: BorderStyle.solid,
          ),
        ),
        width: context.width * 0.80,
        height: context.height * 0.68,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(ImageNetwork.logoFlat, width: context.width > context.height? 80 : 150,),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
                child: Text("Please Wait,\nWe’re getting the best results",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.loaderTitleText,
                ),
              ),
              Text("We make our best, hopefully the result will make you satisfied. The result is coming very soon.",
                textAlign: TextAlign.center,
                style: AppTextStyle.loaderSubtitleText,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: LoadingAnimationWidget.prograssiveDots(color: AppColors.textPrimary, size: 55,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
