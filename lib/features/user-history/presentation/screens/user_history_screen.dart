import 'package:facetcher/config/routes/app_routes.dart';
import 'package:facetcher/core/utils/media_query_values.dart';
import 'package:facetcher/features/user-history/presentation/cubit/current_user_submissions_cubit.dart';
import 'package:facetcher/features/user-history/presentation/widget/user_submissions_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/icons/animated_icon_button.dart';
import '../../../../core/widgets/navigator/navigation_bar_wrapper.dart';
import '../cubit/current_user_submissions_state.dart';

class UserHistoryScreen extends StatefulWidget {
  const UserHistoryScreen({Key? key}) : super(key: key);

  @override
  State<UserHistoryScreen> createState() => _UserHistoryScreenState();
}

class _UserHistoryScreenState extends State<UserHistoryScreen> {
  bool _toggleNavigationBar = false;

  void _handleToggleNavigationBar() {
    setState(() {
      _toggleNavigationBar = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentUserSubmissions();
  }

  _getCurrentUserSubmissions() => BlocProvider.of<CurrentUserSubmissionsCubit>(context).getCurrentUserSubmissions();

  @override
  Widget build(BuildContext context) {
    return NavigationBarWrapper(
      toggleNavigationBar: _toggleNavigationBar,
      path: ModalRoute.of(context)?.settings.name,
      child: Material(
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: true,
          body: Column(
            children: [
              AppBarWidget(
                leftChild: IconButton(
                  icon: Icon(Icons.arrow_back, color: AppColors.white),
                  onPressed: () => Navigator.pushReplacementNamed(context, Routes.appHome),
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
              Text("Submissions History", style: AppTextStyle.drawingScreenTitle,),
              const SizedBox(height: 20.0,),
              BlocConsumer<CurrentUserSubmissionsCubit, CurrentUserSubmissionsState>(
                builder: ((context, state) {
                  if (state is CurrentUserSubmissionsSuccess) {
                    return UserSubmissionsListWidget(submissions: state.response.body.where((submission) => submission.submitted == true).toList());
                  } else {
                    return Padding(
                      padding: EdgeInsets.only(top: context.height * 0.30),
                      child: Center(
                        child: LoadingAnimationWidget.threeArchedCircle(color: AppColors.textPrimary, size: 60),
                      ),
                    );
                  }
                }),
                listener: ((context, state) {
                  if (state is CurrentUserSubmissionsError) {
                    Constants.showSnackBar(context: context, message: state.message);
                    Navigator.pushReplacementNamed(context, Routes.appHome);
                  }
                }),
              ),
            ],
          )),
      ),
    );
  }
}
