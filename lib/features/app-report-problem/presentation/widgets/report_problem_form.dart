import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/validation/validation_types.dart';
import '../../../../core/widgets/buttons/button_widget.dart';
import '../../../../core/widgets/forms/text_field_widget.dart';
import '../../domain/entities/Report_problem_request.dart';

class ReportProblemForm extends StatefulWidget {
  const ReportProblemForm({Key? key}) : super(key: key);

  @override
  State<ReportProblemForm> createState() => _ReportProblemFormState();
}

class _ReportProblemFormState extends State<ReportProblemForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ReportProblemRequest reportProblemRequest = ReportProblemRequest(
      title: reportProblemRequest.title,
      description: reportProblemRequest.description);
  final bool isFormEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "Get in Touch",
                  style: AppTextStyle.drawingScreenTitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: TextFieldWidget(
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
                    reportProblemRequest.title = value;
                  },
                  contentPadding: const EdgeInsets.only(
                    top: 12,
                    left: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
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
                    reportProblemRequest.description = value;
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
                    if (reportProblemRequest.title.isEmpty) {
                      Constants.showSnackBar(
                          context: context, message: "Title can't be blank");
                      return;
                    }
                    if (reportProblemRequest.description.isEmpty) {
                      Constants.showSnackBar(
                          context: context,
                          message: "Description can't be blank");
                      return;
                    }
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Next",
                      style: AppTextStyle.buttonText,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.arrow_forward_sharp,
                      color: AppColors.textPrimary,
                      size: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
