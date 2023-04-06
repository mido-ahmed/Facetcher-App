import 'package:facetcher/core/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:facetcher/core/utils/app_text_style.dart';

import '../../../../data/models/user-trial/user_trial.dart';

class FaceDetails extends StatefulWidget {
  final UserTrial userTrial;
  const FaceDetails({Key? key, required this.userTrial}) : super(key: key);

  @override
  State<FaceDetails> createState() => _FaceDetailsState();
}

class _FaceDetailsState extends State<FaceDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: Column(
        children: [
          Row(
            children: [
              Text("Title: ", style: AppTextStyle.textReportFieldTitle,),
              Text(widget.userTrial.title, style: AppTextStyle.textReportField,),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              children: [
                Text("Gender: ", style: AppTextStyle.textReportFieldTitle,),
                Text(StringUtil.capitalizeFirstLetter(widget.userTrial.gender), style: AppTextStyle.textReportField,),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Description: ", style: AppTextStyle.textReportFieldTitle,),
              Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Text(widget.userTrial.description, style: AppTextStyle.textReportField,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
