import 'package:facetcher/features/drawing-details/presentation/cubit/create_user_submission_cubit.dart';
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
  late final DrawingDetailsRequest _drawingDetailsRequest = DrawingDetailsRequest();
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Column(children: [
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
                  onSave: (value) {_drawingDetailsRequest.title = value;},
                  contentPadding: const EdgeInsets.only(top: 12, left: 30,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: DropdownButtonFormField(
                    iconSize: 30,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.textSecondary,),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 30, right: 10),
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
                    hint: Text('Gender', style: AppTextStyle.drawingDetailsField,),
                    items: ['Male', 'Female'].map((item) {
                      return DropdownMenuItem(
                        enabled: true,
                        alignment: Alignment.centerLeft,
                        value: item,
                        child: Text(item, style: AppTextStyle.loginFieldText,),
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
                      _drawingDetailsRequest.gender = selectedItem;
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
                  onSave: (value) {_drawingDetailsRequest.description = value;},
                  contentPadding: const EdgeInsets.only(top: 40, left: 30,),
                ),
              ],),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: BlocConsumer<CreateUserSubmissionCubit, CreateUserSubmissionState>(
                builder: ((context, state) {
                  if (state is CreateUserSubmissionLoading) {
                    return AbsorbPointer(
                      absorbing: true,
                      child: ButtonWidget(
                        onPress: () {},
                        backgroundColor: AppColors.navigatorItem,
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
                      backgroundColor: AppColors.navigatorItem,
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState?.save();
                          if (_drawingDetailsRequest.title.isEmpty) {
                            Constants.showErrorDialog(context: context, message: "Title can't be blank");
                            return;
                          }
                          if (_drawingDetailsRequest.gender == "NULL") {
                            Constants.showErrorDialog(context: context, message: "Gender must be assigned");
                            return;
                          }
                          if (_drawingDetailsRequest.description.isEmpty) {
                            Constants.showErrorDialog(context: context, message: "Description can't be blank");
                            return;
                          }
                          BlocProvider.of<CreateUserSubmissionCubit>(context).createUserSubmission(_drawingDetailsRequest);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Next", style: AppTextStyle.buttonText,),
                          const SizedBox(width: 4,),
                          Icon(Icons.arrow_forward_sharp, color: AppColors.textPrimary, size: 17,),
                        ],
                      ),
                    );
                  }
                }),
                listener: ((context, state) {
                  if (state is CreateUserSubmissionError) {
                    Constants.showErrorDialog(context: context, message: state.message);
                  } else if (state is CreateUserSubmissionSuccess) {
                    Navigator.pushNamed(context, Routes.appDrawingScreen,  arguments: {'submissionId': state.userSubmission.body.id,},);
                  }
                  if (state is CreateUserSubmissionLoading) {
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
