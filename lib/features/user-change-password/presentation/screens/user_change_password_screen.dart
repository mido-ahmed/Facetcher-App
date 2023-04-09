import 'package:facetcher/features/user-change-password/domain/entities/change_user_password_request.dart';
import 'package:flutter/material.dart';
import 'package:facetcher/core/utils/app_colors.dart';
import 'package:facetcher/core/validation/validation_types.dart';
import 'package:facetcher/core/widgets/app_bar_widget.dart';
import 'package:facetcher/core/widgets/forms/text_field_widget.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/icons/animated_icon_button.dart';
import '../../../../core/widgets/navigator/navigation_bar_wrapper.dart';

class UserChangePasswordScreen extends StatefulWidget {
  const UserChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<UserChangePasswordScreen> createState() => _UserChangePasswordScreen();
}

class _UserChangePasswordScreen extends State<UserChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final UserChangePasswordRequest _userChangePasswordRequest = UserChangePasswordRequest();
  bool _toggleNavigationBar = false;
  bool _isFormEnabled = true;

  void _handleToggleNavigationBar() {
    setState(() {
      _toggleNavigationBar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBarWrapper(
      toggleNavigationBar: _toggleNavigationBar,
      path: ModalRoute.of(context)?.settings.name,
      child: Material(
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                AppBarWidget(
                  leftChild: IconButton(
                    icon: Icon(Icons.arrow_back, color: AppColors.white),
                    onPressed: () => Navigator.pushReplacementNamed(context, Routes.userProfile),
                  ),
                  rightChild: AnimatedIconButton(
                    icon: AnimatedIcons.menu_close,
                    color: AppColors.fontPrimary,
                    onPressed: () => _handleToggleNavigationBar(),
                    durationMilliseconds: 500,
                    size: 32.0,
                    end: 1.0,
                  ),
                ),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Change Password', style: AppTextStyle.profileTitles,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
                          child: Text('Changing your password is on all your responsibility and forgetting password may cause you legal issues.', style: AppTextStyle.profileSubTitles),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: TextFieldWidget(
                            enabled: _isFormEnabled,
                            hintText: 'Current password',
                            hintTextStyle: AppTextStyle.loginFieldText,
                            keyboardType: TextInputType.visiblePassword,
                            validateType: ValidationTypes.signinPassword,
                            errorStyle: AppTextStyle.loginFieldErrorText,
                            errorBorderColor: AppColors.error,
                            borderColor: AppColors.border,
                            borderWidth: 1,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: AppTextStyle.loginFieldText,
                            cursorColor: AppColors.textSecondary,
                            secureText: true,
                            onSave: (value) { _userChangePasswordRequest.password = value;},
                            contentPadding: const EdgeInsets.only(top: 12.0, left: 30.0,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('New Password', style: AppTextStyle.profileTitles,),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
                                child: Text('Password requirements: \n• English uppercase characters (A — Z) \n• English lowercase characters (a — z) '
                                    '\n• Base 10 digits (0 — 9) \n• Non-alphanumeric (For example: !, \$, #, or %),', style: AppTextStyle.profileSubTitles),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: TextFieldWidget(
                            enabled: _isFormEnabled,
                            hintText: 'New password',
                            hintTextStyle: AppTextStyle.loginFieldText,
                            keyboardType: TextInputType.visiblePassword,
                            validateType: ValidationTypes.signinPassword,
                            errorStyle: AppTextStyle.loginFieldErrorText,
                            errorBorderColor: AppColors.error,
                            borderColor: AppColors.border,
                            borderWidth: 1,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: AppTextStyle.loginFieldText,
                            cursorColor: AppColors.textSecondary,
                            secureText: true,
                            onSave: (value) { _userChangePasswordRequest.newPassword = value;},
                            contentPadding: const EdgeInsets.only(top: 12.0, left: 30.0,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFieldWidget(
                            enabled: _isFormEnabled,
                            hintText: 'Confirm password',
                            hintTextStyle: AppTextStyle.loginFieldText,
                            keyboardType: TextInputType.visiblePassword,
                            validateType: ValidationTypes.signinPassword,
                            errorStyle: AppTextStyle.loginFieldErrorText,
                            errorBorderColor: AppColors.error,
                            borderColor: AppColors.border,
                            borderWidth: 1,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: AppTextStyle.loginFieldText,
                            cursorColor: AppColors.textSecondary,
                            secureText: true,
                            onSave: (value) { _userChangePasswordRequest.newPasswordConfirm = value;},
                            contentPadding: const EdgeInsets.only(top: 12.0, left: 30.0,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
