import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/validation/validation_types.dart';
import '../../../../core/widgets/buttons/button_widget.dart';
import '../../../../core/widgets/forms/text_field_widget.dart';
import '../../../drawing-details/domain/entities/drawing_details_request.dart';

class ReportProblemForm extends StatefulWidget {
  const ReportProblemForm({Key? key}) : super(key: key);

  @override
  State<ReportProblemForm> createState() => _ReportProblemFormState();
}

class _ReportProblemFormState extends State<ReportProblemForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late DrawingDetailsRequest drawingDetailsRequest = DrawingDetailsRequest();
  bool isFormEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: Column(
            children: [
              TextFieldWidget(
                enabled: isFormEnabled,
                hintText: 'Title',
                hintTextStyle: AppTextStyle.drawingDetailsField,
                keyboardType: TextInputType.emailAddress,
                validateType: ValidationTypes.drawingDetailsTitle,
                errorStyle: AppTextStyle.loginFieldErrorText,
                errorBorderColor: AppColors.error,
                borderColor: AppColors.border,
                borderWidth: 1,
                maxLines: 1,
                textAlign: TextAlign.start,
                style: AppTextStyle.loginFieldText,
                cursorColor: AppColors.textSecondary,
                secureText: false,
                onSave: (value) {
                  drawingDetailsRequest.title = value;
                },
                contentPadding: const EdgeInsets.only(
                  top: 12,
                  left: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextFieldWidget(
                  enabled: isFormEnabled,
                  hintText: 'Description',
                  hintTextStyle: AppTextStyle.drawingDetailsField,
                  keyboardType: TextInputType.emailAddress,
                  validateType: ValidationTypes.drawingDetailsDescription,
                  errorStyle: AppTextStyle.loginFieldErrorText,
                  errorBorderColor: AppColors.error,
                  borderColor: AppColors.border,
                  borderWidth: 1,
                  maxLines: 10,
                  textAlign: TextAlign.start,
                  style: AppTextStyle.loginFieldText,
                  cursorColor: AppColors.textSecondary,
                  secureText: false,
                  onSave: (value) {
                    drawingDetailsRequest.description = value;
                  },
                  contentPadding: const EdgeInsets.only(
                    top: 40,
                    left: 30,
                  ),
                ),
              ),
              ButtonWidget(
                backgroundColor: AppColors.button,
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    if (drawingDetailsRequest.title.isEmpty) {
                      Constants.showSnackBar(
                          context: context, message: "Title can't be blank");
                      return;
                    }
                    if (drawingDetailsRequest.gender == "NULL") {
                      Constants.showSnackBar(
                          context: context, message: "Gender must be assigned");
                      return;
                    }
                    if (drawingDetailsRequest.description.isEmpty) {
                      Constants.showSnackBar(
                          context: context,
                          message: "Description can't be blank");
                      return;
                    }
                  }
                },
                child: Text("Send"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
