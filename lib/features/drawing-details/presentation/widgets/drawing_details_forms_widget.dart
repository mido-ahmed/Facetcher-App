import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/validation/validation_types.dart';
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
              padding: const EdgeInsets.all(20.0),
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
                },
                contentPadding: const EdgeInsets.only(
                  top: 12,
                  left: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 90, top: 15, bottom: 10),
              child: RichText(
                text: TextSpan(
                  text: 'Choose the drawing gender',
                  style: AppTextStyle.drawingDetailsField,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
              child: DropdownButtonFormField(
                iconSize: 35,
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.textSecondary,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20, right: 10),
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
                borderRadius: BorderRadius.circular(20),
                dropdownColor: AppColors.background,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 18,
                ),
                hint: Text(
                  'Choose the Gender ...',
                  style: AppTextStyle.drawingDetailsField,
                ),
                onSaved: (value) {
                  _drawingDetailsRequest.gender = value;
                },
                items: ['Male', 'Female']
                    .map(
                      (e) => DropdownMenuItem(
                        alignment: Alignment.centerLeft,
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    selectedItem = val;
                  });
                },
                value: selectedItem,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextFieldWidget(
                enabled: _isFormEnabled,
                hintText: 'Password',
                hintTextStyle: AppTextStyle.drawingDetailsField,
                keyboardType: TextInputType.visiblePassword,
                validateType: ValidationTypes.drawingDetailsDescription,
                errorStyle: AppTextStyle.loginFieldErrorText,
                errorBorderColor: AppColors.error,
                borderColor: AppColors.border,
                borderWidth: 1,
                maxLines: 1,
                textAlign: TextAlign.start,
                style: AppTextStyle.loginFieldText,
                cursorColor: AppColors.textSecondary,
                secureText: true,
                onSave: (value) {
                  _drawingDetailsRequest.description = value;
                },
                contentPadding: const EdgeInsets.only(
                  top: 12,
                  left: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
