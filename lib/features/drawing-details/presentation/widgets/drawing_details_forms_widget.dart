import 'package:flutter/material.dart';
import 'package:flutter_starter/core/utils/constants.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/validation/validation_types.dart';
import '../../../../core/widgets/buttons/button_widget.dart';
import '../../../../core/widgets/forms/text_field_widget.dart';
import '../../domain/entities/drawing_details_request.dart';

class DrawingDetailsForms extends StatefulWidget {
  const DrawingDetailsForms({Key? key}) : super(key: key);

  @override
  State<DrawingDetailsForms> createState() => _DrawingDetailsFormsState();
}

class _DrawingDetailsFormsState extends State<DrawingDetailsForms> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final DrawingDetailsRequest _drawingDetailsRequest =
      DrawingDetailsRequest();
  final _isFormEnabled = true;
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
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                onSave: (value) {
                  _drawingDetailsRequest.title = value;
                  print(value);
                },
                contentPadding: const EdgeInsets.only(
                  top: 12,
                  left: 30,
                ),
              ),
            ),
            //TODO: Change widget to plugin animated_custom_dropdown: ^1.5.0
            Container(
              padding: EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 20.0, bottom: 20.0),
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: DropdownButtonFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                iconSize: 30,
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.textSecondary,
                ),
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
                isExpanded: true,
                isDense: true,
                borderRadius: BorderRadius.circular(25),
                dropdownColor: AppColors.background,
                style: AppTextStyle.dropDownItem,
                hint: Text(
                  'Gender',
                  style: AppTextStyle.drawingDetailsField,
                ),
                items: ['Male', 'Female']
                    .map(
                      (e) => DropdownMenuItem(
                        enabled: true,
                        alignment: Alignment.centerLeft,
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                itemHeight: null,
                onChanged: (val) {
                  setState(() {
                    selectedItem = val;
                  });
                },
                value: selectedItem,
                onSaved: (value) {
                  if (value == "Male") {
                    selectedItem = value.toString().toUpperCase();
                    print(selectedItem);
                  } else {
                    selectedItem = value.toString().toUpperCase();
                    print(selectedItem);
                  }
                  _drawingDetailsRequest.gender = selectedItem;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
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
                maxLines: 14,
                textAlign: TextAlign.start,
                style: AppTextStyle.loginFieldText,
                cursorColor: AppColors.textSecondary,
                secureText: false,
                onSave: (value) {
                  _drawingDetailsRequest.description = value;
                  print(value);
                },
                contentPadding: const EdgeInsets.only(
                  top: 40,
                  left: 30,
                ),
              ),
            ),
            ButtonWidget(
              backgroundColor: AppColors.navigatorItem,
              onPress: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                  if (_drawingDetailsRequest.title.isEmpty) {
                    Constants.showErrorDialog(
                        context: context, message: "Title can't be blank");
                    return;
                  }
                  if (_drawingDetailsRequest.gender == "NULL") {
                    Constants.showErrorDialog(
                        context: context, message: "Gender must be assigned");
                    return;
                  }
                  if (_drawingDetailsRequest.description.isEmpty) {
                    Constants.showErrorDialog(
                        context: context,
                        message: "Description can't be blank");
                    return;
                  }
                  Navigator.of(context).pushNamed('/app-drawing-screen');
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Next",
                    style: AppTextStyle.buttonText,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Icons.arrow_forward_sharp,
                    color: AppColors.textPrimary,
                    size: 17,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
