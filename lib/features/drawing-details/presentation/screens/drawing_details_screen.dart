import 'package:facetcher/core/widgets/navigator/navigation_bar_wrapper.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/icons/animated_icon_button.dart';
import '../widgets/drawing_details_forms_widget.dart';

class DrawingDetailsScreen extends StatefulWidget {
  const DrawingDetailsScreen({Key? key}) : super(key: key);

  @override
  State<DrawingDetailsScreen> createState() => DrawingDetailsState();
}

class DrawingDetailsState extends State<DrawingDetailsScreen> {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppBarWidget(
                  leftChild: IconButton(
                    icon: Icon(Icons.arrow_back, color: AppColors.white),
                    onPressed: () => Navigator.pop(context),
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
                     Text("Drawing Details",
                       style: AppTextStyle.drawingScreenTitle,
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                       child: Text("Enter all the details and description for the drawing, as all what you do here is recorded",
                         textAlign: TextAlign.center,
                         style: AppTextStyle.drawingScreenTitleDetails,
                       ),
                     ),
                     const DrawingDetailsForm(),
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
