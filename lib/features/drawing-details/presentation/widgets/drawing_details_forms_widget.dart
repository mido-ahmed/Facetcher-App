import 'package:facetcher/features/drawing-details/presentation/cubit/create_or_update_user_submission_cubit.dart';
import 'package:flutter/material.dart';
import 'package:facetcher/core/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/validation/validation_types.dart';
import '../../../../core/widgets/buttons/button_widget.dart';
import '../../../../core/widgets/forms/text_field_widget.dart';
import '../../domain/entities/drawing_details_request.dart';

class DrawingDetailsForm extends StatefulWidget {
  const DrawingDetailsForm({Key? key}) : super(key: key);

  @override
  State<DrawingDetailsForm> createState() => _DrawingDetailsFormState();
}

class _DrawingDetailsFormState extends State<DrawingDetailsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late DrawingDetailsRequest drawingDetailsRequest = DrawingDetailsRequest();
  bool _isFormEnabled = true;
  var selectedItem;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Column(
          children: [
            Column(
              children: [
                TextFieldWidget(
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
                  onSave: (value) {drawingDetailsRequest.title = value;},
                  contentPadding: const EdgeInsets.only(top: 12, left: 30,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: DropdownButtonFormField(
                    iconSize: 30,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.textSecondary,),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 30, right: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.grey, width: 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.grey, width: 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.grey, width: 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    borderRadius: BorderRadius.circular(25),
                    dropdownColor: AppColors.background,
                    style: AppTextStyle.dropDownItem,
                    hint: Text('Gender', style: AppTextStyle.dropDownItemTitle,),
                    items: ['Male', 'Female'].map((item) {
                      return DropdownMenuItem(
                        enabled: true,
                        alignment: Alignment.centerLeft,
                        value: item,
                        child: Text(item, style: AppTextStyle.dropDownItem,),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedItem = value;
                      });
                    },
                    value: selectedItem,
                    onSaved: (value) {
                      if (value == "Male") {
                        selectedItem = value;
                      } else {
                        selectedItem = value;
                      }
                      drawingDetailsRequest.gender = selectedItem;
                    },
                  ),
                ),
                TextFieldWidget(
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
                  onSave: (value) {drawingDetailsRequest.description = value;},
                  contentPadding: const EdgeInsets.only(top: 40, left: 30,),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: BlocConsumer<CreateOrUpdateUserSubmissionCubit, CreateOrUpdateUserSubmissionState>(
                builder: ((context, state) {
                  if (state is CreateOrUpdateUserSubmissionLoading) {
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
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState?.save();
                          if (drawingDetailsRequest.title.isEmpty) {
                            Constants.showSnackBar(context: context, message: "Title can't be blank");
                            return;
                          }
                          if (drawingDetailsRequest.gender == "NULL") {
                            Constants.showSnackBar(context: context, message: "Gender must be assigned");
                            return;
                          }
                          if (drawingDetailsRequest.description.isEmpty) {
                            Constants.showSnackBar(context: context, message: "Description can't be blank");
                            return;
                          }
                          BlocProvider.of<CreateOrUpdateUserSubmissionCubit>(context).createOrUpdateUserSubmission(drawingDetailsRequest);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Next", style: AppTextStyle.buttonText,),
                            const SizedBox(width: 4,),
                            Icon(Icons.arrow_forward_sharp, color: AppColors.textPrimary, size: 17,),
                          ],
                        ),
                      ),
                    );
                  }
                }),
                listener: ((context, state) {
                  if (state is CreateOrUpdateUserSubmissionError) {
                    Constants.showSnackBar(context: context, message: state.message);
                  } else if (state is CreateOrUpdateUserSubmissionSuccess) {
                    drawingDetailsRequest.submissionId = state.userSubmission.body.id;
                    Navigator.pushNamed(context, Routes.appDrawingScreen, arguments: state.userSubmission.body.id,);
                  }
                  if (state is CreateOrUpdateUserSubmissionLoading) {
                    setState(() {
                      _isFormEnabled = false;
                    });
                  } else {
                    setState(() {
                      _isFormEnabled = true;
                    });
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
