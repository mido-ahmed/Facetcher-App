import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/icons/animated_icon_button.dart';
import '../../../../core/widgets/navigator/navigation_bar_wrapper.dart';
import '../widgets/report_problem_form.dart';

class ReportProblemScreen extends StatefulWidget {
  const ReportProblemScreen({Key? key}) : super(key: key);

  @override
  State<ReportProblemScreen> createState() => _ReportProblemScreenState();
}

class _ReportProblemScreenState extends State<ReportProblemScreen> {
  bool _toggleNavigationBar = false;

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
            physics: const ScrollPhysics(),
            child: Column(
              children: [
                AppBarWidget(
                  leftChild: IconButton(
                      icon: Icon(Icons.arrow_back, color: AppColors.white),
                      onPressed: () {Navigator.pushReplacementNamed(context, Routes.appHome);}
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Column(
                    children: [
                      Text("Get In Touch", style: AppTextStyle.drawingScreenTitle,),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                        child: Text("Stay connected with us and reach us anytime",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.drawingScreenTitleDetails,
                        ),
                      ),
                      const ReportProblemForm(),
                    ],
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
