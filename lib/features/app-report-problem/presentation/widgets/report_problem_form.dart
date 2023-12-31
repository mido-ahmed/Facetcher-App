import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/validation/validation_types.dart';
import '../../../../core/widgets/buttons/button_widget.dart';
import '../../../../core/widgets/forms/text_field_widget.dart';
import '../../domain/entities/Report_problem_request.dart';
import '../cubit/report_problem_cubit.dart';

class ReportProblemForm extends StatefulWidget {
  const ReportProblemForm({Key? key}) : super(key: key);

  @override
  State<ReportProblemForm> createState() => _ReportProblemFormState();
}

class _ReportProblemFormState extends State<ReportProblemForm> {
  late final ReportProblemRequest reportProblemRequest = ReportProblemRequest();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isFormEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: TextFieldWidget(
                enabled: _isFormEnabled,
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
                onSave: (value) { reportProblemRequest.title = value; },
                contentPadding: const EdgeInsets.only(top: 12, left: 30,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: TextFieldWidget(
                enabled: _isFormEnabled,
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
                onSave: (value) { reportProblemRequest.description = value; },
                contentPadding: const EdgeInsets.only(top: 40, left: 30,),
              ),
            ),
            BlocConsumer<ReportProblemCubit, ReportProblemState>(
                builder: ((context, state) {
              if (state is ReportProblemLoading) {
                return AbsorbPointer(
                  absorbing: true,
                  child: ButtonWidget(
                    onPress: () {},
                    backgroundColor: AppColors.button,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                );
              } else {
                return ButtonWidget(
                  backgroundColor: AppColors.button,
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      if (reportProblemRequest.title.isEmpty) {
                        Constants.showSnackBar(context: context, message: "Title can't be blank");
                        return;
                      }
                      if (reportProblemRequest.description.isEmpty) {
                        Constants.showSnackBar(context: context, message: "Description can't be blank");
                        return;
                      }
                      BlocProvider.of<ReportProblemCubit>(context).createUserMessageUs(reportProblemRequest);
                    }
                  },
                  child: Text("Submit", style: AppTextStyle.buttonText,
                  ),
                );
              }
            }), listener: ((context, state) {
              if (state is ReportProblemError) {
                Constants.showSnackBar(context: context, message: state.message);
              } else if (state is ReportProblemSuccess) {
                Constants.showSnackBar(context: context, message: state.userSubmission.message);
                Navigator.pushReplacementNamed(context, Routes.appHome);
              }
              if (state is ReportProblemLoading) {
                setState(() { _isFormEnabled = false;});
              } else {
                setState(() { _isFormEnabled = true;});
              }
            })),
          ],
        ),
      ),
    );
  }
}
