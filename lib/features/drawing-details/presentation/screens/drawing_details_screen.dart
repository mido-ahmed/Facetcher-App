import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/icons/animated_icon_button.dart';
import '../../../../core/widgets/navigator/navigation_bar_wrapper.dart';
import '../widgets/drawing_details_forms_widget.dart';

class DrawingDetails extends StatefulWidget {
  const DrawingDetails({Key? key}) : super(key: key);

  @override
  State<DrawingDetails> createState() => _DrawingDetailsState();
}

class _DrawingDetailsState extends State<DrawingDetails> {
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
          body: Column(
            children: [
              AppBarWidget(
                leftChild: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          size: 35,
                          color: AppColors.white,
                        ))
                  ],
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
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      "Add drawing details",
                      style: AppTextStyle.drawingScreenTitle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Enter all the details and description for the drawing, as all what you do here is recorded",
                        style: AppTextStyle.drawingScreenTitleDetails,
                      ),
                    ),
                  ],
                ),
              ),
              DrawingDetailsForms()
            ],
          ),
        ),
      ),
    );
  }
}
